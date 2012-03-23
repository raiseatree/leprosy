<cfcomponent extends="Controller" output="false">

	<cffunction name="authenticateUser">
	
		<!--- Check if the user is logged in or not --->
		<cfif Not(IsUserLoggedIn())>
			<!--- Forward to the login page --->
			<cfset redirectTo(action="index")>
		</cfif>
	
	</cffunction>

	<cffunction name="init">
	
		<!--- Set up a filter to authenticate the user --->
		<cfset filters(through="authenticateUser", except="index")>
	
	</cffunction>

	<cffunction name="index">
	
		<!--- Provide the login form for users --->
	
	</cffunction>

</cfcomponent>