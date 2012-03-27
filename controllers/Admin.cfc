<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Set up a filter to authenticate the user --->
		<cfset filters(through="authenticateUser", except="index")>
	
	</cffunction>

	<cffunction name="index">
	
		<!--- Provide the login form for users --->
		<cfset data.user = model("user").new()>
	
	</cffunction>

	<cffunction name="home">
	
	</cffunction>

</cfcomponent>