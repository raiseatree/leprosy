<cfcomponent extends="Model" output="false">
	
	<cffunction name="init">
	
		<!--- Associations --->
		
		<!--- Error Messages --->
		<cfset validatesPresenceOf(property="countryName", message="Country Name cannot be empty")>
	</cffunction>
	
	
</cfcomponent>