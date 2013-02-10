<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="delete" hint="Deletes a photo">
	
		<cfif IsDefined("params.ID")>
		
			<!--- Delete the photo --->
			<cfset del = model("photo").deleteOne(where="ID=#params.ID#")>
			
			<cfif del EQ true>
				<cfset flashInsert(success="Photo deleted successfully")>
				<cfset redirectTo(back=true)>
			<cfelse>
				<cfset flashInsert(error="Sorry there was an error deleting the photo")>
				<cfset redirectTo(back=true)>
			</cfif>
		
		<cfelse>
			<cfset flashInsert(error="Sorry you need to click the link properly to delete photos")>
			<cfset redirectTo(back=true)>
		</cfif>
	
	</cffunction>
	
	<cffunction name="update">
		
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