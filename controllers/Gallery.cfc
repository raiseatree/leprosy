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
	
	<cffunction name="delete">
	
		<!--- Find the country and update --->
		<cfset gallery = model("gallery").findOneByID(params.id)>	
		<cfset deleteResult = gallery.delete()>
	
		<!--- Check the result --->
		<cfif deleteResult EQ false>
			<cfset data.gallery = gallery>
			<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
			<cfset renderPage(template="overview")>
		<cfelse>
		
			<!--- Now delete the folder of all photos --->
			<cftry>
				<cfset dir = ExpandPath('miscellaneous/#gallery.id#')>
				<cfdirectory action="delete" directory="#dir#" recurse="true">
				<cfset flashInsert(success="Gallery Deleted Successfully")>
				
				<cfcatch type="any">
					<cfset flashInsert(error="Could no delete photos from the server but gallery has been deleted")>
				</cfcatch>
			</cftry>
			
			<cfset redirectTo(controller="country", action="overview", params="ID=#gallery.countryID#")>
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
	
		<!--- Set the defauly page for paginated data --->
		<cfparam name="params.page" default="1">

		<!--- Load this gallery --->
		<cfset data.gallery = model("gallery").findOneByID(ID=params.ID, returnAs="query")>
		<cfset data.photos = model("photo").findAll(where="galleryID=#params.ID#", page=params.page, perPage=8, include="gallery", order="ID ASC")>
	
	</cffunction>

	<cffunction name="processUpload">
	
		<!--- Expire the cookie we set immediately --->
		<cfcookie name="galleryID" expires="now">
	
		<!--- Check this gallery's folder for images --->
		<cfset dir = ExpandPath('miscellaneous/#params.ID#')>
		
		<!--- Check Directory Exists --->
		<cfif DirectoryExists(dir)>
		
			<!--- See if we have any files to process --->
			<cfdirectory action="list" directory="#dir#" recurse="false" filter="*.JPG|*.jpg" name="galleryPhotos" sort="name ASC">
					
			<!--- Loop through each of the photos and add to the DB --->
			<cfloop query="galleryPhotos">
			
				<!--- Check if we have this photo in the gallery already --->
				<cfset checkPhoto = model("photo").findOne(where="galleryID=#params.ID# AND filename='#galleryPhotos.name#'")>
				
				<!--- Only add the photo if it doesn't already exist --->
				<cfif Not(IsObject(checkPhoto))>
				
					<!--- Add the photo --->
					<cfset addPhoto = model("photo").create(galleryID=params.ID, filename=galleryPhotos.name)>
				
					<cfif addPhoto.hasErrors()>
						<cfset flashInsert(error="An error occurred whilst processing photo (filename - #galleryPhotos.name#)")>
						<cfset redirectTo(action="upload", params="ID=#params.ID#")>
					</cfif>
					
				</cfif>
			</cfloop>
			
			<!--- Flash and return --->
			<cfset flashInsert(success="Processed #galleryPhotos.RecordCount# photos successfully")>
			<cfset redirectTo(action="overview", params="ID=#params.ID#")>
			
		<cfelse>
			<cfset flashInsert(error="No photos found, please try re-uploading.")>
			<cfset redirectTo(action="upload", params="ID=#params.ID#")>
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
				<cfset redirectTo(controller="country", action="overview", params="ID=#gallery.countryID#")>
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