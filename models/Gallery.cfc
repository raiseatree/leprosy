<cfcomponent extends="Model" output="false">
	
	<cffunction name="init">
	
		<!--- Associations --->
		<cfset hasMany("photo")>
		
		
		<!--- Error Messages --->
		<cfset validatesPresenceOf(property="galleryName", message="Gallery Name cannot be empty")>
		<cfset validatesPresenceOf(property="description", message="Description cannot be empty")>
	</cffunction>
	
	
</cfcomponent>