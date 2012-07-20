<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
		
	</cffunction>
	
	<!---<cffunction name="create">
	
		<cfset user.email = "info@tom-bradley.com">
		
		<!--- First create a salt and hash the password --->
		<cfset theSalt = CreateUUID()>
		<cfset user.password = Hash("Passw0rd" & theSalt, 'SHA-512')>
		
		<!--- Next encrypt the salt --->
		<cfset user.passwordsalt = encrypt(theSalt,getEncryptKey(),'CFMX_COMPAT','hex')>
	
		<cfset result = model("user").create(user)>
	
		<cfif result.hasErrors()>
			<cfdump var="#result.allErrors()#">
		</cfif>
	
		<cfabort>
	
	</cffunction>--->
	
	<cffunction name="login">
	
		<cfif IsPost()>
		
			<!--- See if this user is in the db --->
			<cfset user = model("user").findOneByEmail(email=params.user.email)>
			
			<cfif IsObject(user)>
				<!--- Email address found, check the password matches --->
				<cfset theSalt = decrypt(user.passwordSalt,getEncryptKey(),'CFMX_COMPAT','hex')>
				<cfset hashedPwd = hash(params.user.password & theSalt, 'SHA-512')>
				
				<!--- Now check the password provided against the db --->
				<cfif user.password EQ hashedPwd>
					
					<!--- Check if we want to be remembered --->
					<cfif IsDefined("params.cookie") AND params.cookie EQ 1>
						<!--- Store a cookie (primarily used for auto-login on iPhone) --->
						<cfcookie name="userID" value="#encrypt(user.id, GetEncryptKey(), "CFMX_COMPAT", "Hex")#" expires="never">
					</cfif>
					
					<!--- Encrypt the user's id and put in the session --->
					<cfset SESSION.userID = encrypt(user.id, GetEncryptKey(), "CFMX_COMPAT", "Hex")>
					
					<!--- Login the user with CF --->
					<cflogin idletimeout="3600">
						
						<cfloginuser 
							name="#user.email#" 
							password="something" 
							roles="admin" />
						
					</cflogin>
					
					<!--- Re-direct the user --->
					<cfset redirectTo(controller="admin", action="home")>
					
				<cfelse>
					<!--- Flash and re-render --->
					<cfset flashInsert(error="Sorry your password was incorrect, please try again")>
					<cfset data.user = model("user").new()>
					<cfset data.user.email = params.user.email>
					<cfset renderWith(controller="admin", action="index", data="data")>
				</cfif>
				
			<cfelse>
				<!--- Flash and re-render --->
				<cfset flashInsert(error="Sorry your email address and password were not found, please try again")>
				<cfset data.user = model("user").new()>
				<cfset renderWith(controller="admin", action="index", data="data")>
			</cfif>
			
		<cfelse>
			<!--- Flash and re-direct --->
			<cfset flashInsert(error="Sorry you can't access that function like that")>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>

	<cffunction name="logout">
	
		<!--- Delete the session --->
		<cfset StructClear(session)>
		
		<!--- Clear the cookie --->
		<cfcookie name="userID" expires="now">
		
		<!--- Logout of CF --->
		<cflogout>
		
		<!--- Set a flash message and redirect the user --->
		<cfset flashInsert(success="You have been successfully logged out")>
		<cfset redirectTo(route="home")>
	
	</cffunction>

</cfcomponent>