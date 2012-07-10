<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Run certain actions through the authentication --->
		<cfset filters(through="authenticateUser", except="view")>
	
	</cffunction>
	
	<cffunction name="add">
	
		<cfif IsPost()>
		
			<!--- Add the country --->
			<cfset addResult = model("country").create(params.country)>
		
			<!--- Check the result --->
			<cfif addResult.hasErrors()>
				<cfset data.country = addResult>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="new")>
			<cfelse>
				<cfset flashInsert(success="Country Added Successfully")>
				<cfset redirectTo(action="manage")>
			</cfif>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="edit">
	
		<cfif IsDefined("params.ID")>
			
			<!--- Load the country --->
			<cfset data.country = model("country").findOneByID(params.ID)>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="new">
		
		<cfset data.country = model("country").new()>
		
	</cffunction>
	
	<cffunction name="manage">
	
		<!--- Get a list of countries in the db --->
		<cfset data.countries = model("country").findAll(order="countryName")>
	
	</cffunction>

	<cffunction name="overview">
	
		<!--- Load this country --->
		<cfset data.country = model("country").findOneByID(params.ID)>
		
		<!--- Load all galleries --->
		<cfset data.galleries = model("gallery").findAllByCountryID(data.country.ID)>
		
		<!--- Load all videos --->
		<cfset data.videos = model("video").findAllByCountryID(data.country.ID)>
		
		<!--- Load all writings --->
		<cfset data.experiences = model("experience").findAllByCountryID(data.country.ID)>
	
	</cffunction>

	<cffunction name="update">
	
		<cfif IsPost()>
		
			<!--- Find the country and update --->
			<cfset country = model("country").findOneByID(params.country.id)>
			<cfset updateResult = country.update(params.country)>
		
			<!--- Check the result --->
			<cfif updateResult EQ false>
				<cfset data.country = country>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="edit")>
			<cfelse>
				<cfset flashInsert(success="Country Updated Successfully")>
				<cfset redirectTo(action="manage")>
			</cfif>
			
		</cfif>
	
	
	</cffunction>

	<cffunction name="view">
	
		<cfparam name="params.content" default="photo">
		
		<!--- Save all the params for use again (in switching between photo/video and experience galleries) --->
		<cfset data.params = params>
	
		<!--- Takes a countryID and Content (photo | video | experience) as a param --->
		<cfset data.country = model("country").findOneByID(ID=params.ID, returnAs="query")>
		
		<!--- Work out which content type we want --->
		<cfswitch expression="#params.content#">
			
			<cfcase value="photo">
				<!--- Load all the galleries --->
				<cfset data.galleries = model("gallery").findAllByCountryID(CountryID=params.ID, select="ID AS contentID,countryID,galleryName AS contentName", order="ID DESC")>
				
				<!--- Check we found at least one and load the photos within it if so --->
				<cfif data.galleries.RecordCount GT 0>
					
					<!--- Check if we want to load a specific gallery, otherwise load the first one --->
					<cfif IsDefined("params.contentID")>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("photo").findAll(select="filename,caption,galleryName AS contentName,galleryID AS contentID,description", where="galleryID=#params.contentID#", include="gallery")>
					<cfelse>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("photo").findAll(select="filename,caption,galleryName AS contentName,galleryID AS contentID,description", where="galleryID=#data.galleries.contentID[1]#", include="gallery")>
					</cfif>
				</cfif>
			</cfcase>
			
			<cfcase value="video">
				<cfset data.galleries = model("video").findAllByCountryID(CountryID=params.ID, select="ID AS contentID,countryID,videoName AS contentName", order="ID DESC")>				
			
				<!--- Check we found at least one and load the photos within it if so --->
				<cfif data.galleries.RecordCount GT 0>
				
					<!--- Check if we want to load a specific gallery, otherwise load the first one --->
					<cfif IsDefined("params.contentID")>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("video").findAll(select="videoName AS contentName,ID AS contentID,url,description", where="ID=#params.contentID#")>
					<cfelse>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("video").findAll(select="videoName AS contentName,ID AS contentID,url,description", where="ID=#data.galleries.contentID[1]#")>
					</cfif>
				
				</cfif>
			</cfcase>
			
			<cfcase value="experience">
				<cfset data.galleries = model("experience").findAllByCountryID(CountryID=params.ID, select="ID AS contentID,countryID,experienceName AS contentName", order="experienceName")>			
			
				<!--- Check we found at least one and load the photos within it if so --->
				<cfif data.galleries.RecordCount GT 0>
					
					<!--- Check if we want to load a specific gallery, otherwise load the first one --->
					<cfif IsDefined("params.contentID")>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("experience").findAll(select="experienceName AS contentName,ID AS contentID,content,description", where="ID=#params.contentID#")>
					<cfelse>
						<!--- Load all the photos in this gallery --->
						<cfset data.content = model("experience").findAll(select="experienceName AS contentName,ID AS contentID,content,description", where="ID=#data.galleries.contentID[1]#")>
					</cfif>
				</cfif>
			</cfcase>

		</cfswitch>
		
		<!--- Make sure we found at least one gallery --->
		<cfif data.galleries.RecordCount EQ 0>
			<!--- Flash and redirect --->
			<cfset flashInsert(error="Sorry - this gallery has not currently been completed just yet, please check back soon")>
			<cfset redirectTo(back="true")>
		</cfif>
	
	</cffunction>

</cfcomponent>