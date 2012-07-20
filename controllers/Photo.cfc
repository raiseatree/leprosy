<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="update">
		
		<cflog file="Leprosy" type="info" text="#serialize(params)#">
		
		<cfif IsPost()>
			
			<!--- Format the SensorID as it's sent from jQuery --->
			<cfset photoID = params.id>
			
			<!--- Format the new label --->
			<cfset caption = StripTags(trim(params.value))>
			
			<!--- Update the caption --->
			<cfset result = model("photo").updateByKey(key=photoID, caption=caption)>
			
			<!--- Return the string --->
			<cfoutput>#caption#</cfoutput><cfabort>
		</cfif>
	
	</cffunction>

</cfcomponent>