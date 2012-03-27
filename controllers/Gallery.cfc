<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Run certain actions through the authentication --->
		<cfset filters(through="authenticateUser", except="view")>
	
	</cffunction>
	
	<cffunction name="add">
	
		<cfif IsPost()>
		
			<!--- Add the country --->
			<cfset addResult = model("gallery").create(params.gallery)>
		
			<!--- Check the result --->
			<cfif addResult.hasErrors()>
				<cfset data.country = model("country").findOneByID(params.gallery.countryID)>
				<cfset data.gallery = addResult>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="new")>
			<cfelse>
				<cfset flashInsert(success="Gallery Added Successfully")>
				<cfset redirectTo(action="upload", params="ID=#addResult.ID#")>
			</cfif>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="edit">
	
		<cfif IsDefined("params.ID")>
			
			<!--- Load the country --->
			<cfset data.gallery = model("gallery").findOneByID(params.ID)>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="new">
		
		<cfset data.country = model("country").findOneByID(params.countryID)>
		<cfset data.gallery = model("gallery").new(countryID=data.country.ID)>
		
	</cffunction>

	<cffunction name="overview">
	
		<!--- Load this gallery --->
		<cfset data.gallery = model("gallery").findAllByID(ID=params.ID, include="photo")>
	
	</cffunction>

	<cffunction name="processUpload">
	
		<!--- Expire the cookie we set immediately --->
		<cfcookie name="galleryID" expires="now">
	
		<!--- Check this gallery's folder for images --->
		<cfset dir = ExpandPath('miscellaneous/#params.ID#')>
		
		<!--- Define a list of acceptable file types --->
		<cfset fileTypes = '*.JPG,*.PNG'>
		
		<!--- Check Directory Exists --->
		<cfif DirectoryExists(dir)>
		
			<!--- See if we have any files to process --->
			<cfdirectory action="list" directory="#dir#" recurse="false" filter="*.JPG|*.jpg" name="galleryPhotos">
					
			<cfdump var="#galleryPhotos#"><cfabort>
	
		<cfelse>
			<cfset flashInsert(error="No photos found, please try re-uploading.")>
			<cfset redirectTo(action="upload")>
		</cfif>
	
	</cffunction>

	<cffunction name="update">
	
		<cfif IsPost()>
		
			<!--- Find the country and update --->
			<cfset gallery = model("gallery").findOneByID(params.gallery.id)>
			<cfset updateResult = gallery.update(params.gallery)>
		
			<!--- Check the result --->
			<cfif updateResult EQ false>
				<cfset data.gallery = gallery>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="edit")>
			<cfelse>
				<cfset flashInsert(success="Gallery Updated Successfully")>
				<cfset redirectTo(action="manage")>
			</cfif>
			
		</cfif>

	</cffunction>
	
	<cffunction name="upload">
	
		<!--- Load the gallery --->	
		<cfset data.gallery = model("gallery").findOneByID(params.ID)>
	
		<!--- Put the galleryID in the session briefly to avoid the upload bug --->
		<cfcookie expires="#CreateTimeSpan(0,1,0,0,0)#" name="galleryID" value="#params.ID#">
	
	</cffunction>

</cfcomponent>