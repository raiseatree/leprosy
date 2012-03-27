<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>

	<cffunction name="add">
		
		<cflog file="Leprosy" text="#serialize(params)#">
		
		<cfreturn true>
	
	</cffunction>

</cfcomponent>