<cfcomponent extends="Wheels">

	<cffunction name="authenticateUser">
	
		<!--- Check if the user is logged in or not --->
		<cfif Not(IsUserLoggedIn())>
			<!--- Forward to the login page --->
			<cfset redirectTo(controller="admin", action="index")>
		</cfif>
	
	</cffunction>

</cfcomponent>