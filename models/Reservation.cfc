<cfcomponent extends="Model" output="false">
	
	<cffunction name="init">
	
		<!--- Error Messages --->
		<cfset validatesPresenceOf(property="firstname", message="First Name cannot be empty")>
		<cfset validatesPresenceOf(property="surname", message="Surname cannot be empty")>
		<cfset validatesPresenceOf(property="email", message="Email cannot be empty")>
		<cfset validatesFormatOf(property="email", type="email", message="Please enter a valid email address")>

	</cffunction>
	
</cfcomponent>