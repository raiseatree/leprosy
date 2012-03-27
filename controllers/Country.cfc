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

</cfcomponent>