<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Run certain actions through the authentication --->
		<cfset filters(through="authenticateUser", except="view")>
	
	</cffunction>
	
	<cffunction name="add">
	
		<cfif IsPost()>
		
			<!--- Add the country --->
			<cfset addResult = model("video").create(params.video)>
		
			<!--- Check the result --->
			<cfif addResult.hasErrors()>
				<cfset data.country = model("country").findOneByID(params.video.countryID)>
				<cfset data.video = addResult>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="new")>
			<cfelse>
				<cfset flashInsert(success="Video Added Successfully")>
				<cfset redirectTo(action="overview", params="ID=#addResult.ID#")>
			</cfif>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="delete">
	
		<!--- Find the country and update --->
		<cfset video = model("video").findOneByID(params.id)>
		<cfset deleteResult = video.delete()>
	
		<!--- Check the result --->
		<cfif deleteResult EQ false>
			<cfset data.video = video>
			<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
			<cfset renderPage(template="overview")>
		<cfelse>
			<cfset flashInsert(success="Video Deleted Successfully")>
			<cfset redirectTo(controller="country", action="overview", params="ID=#video.countryID#")>
		</cfif>
		
	</cffunction>
	
	<cffunction name="edit">
	
		<cfif IsDefined("params.ID")>
			
			<!--- Load the country --->
			<cfset data.video = model("video").findOneByID(params.ID)>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="new">
		
		<cfset data.country = model("country").findOneByID(params.countryID)>
		<cfset data.video = model("video").new(countryID=data.country.ID)>
		
	</cffunction>

	<cffunction name="overview">
	
		<!--- Set the defauly page for paginated data --->
		<cfparam name="params.page" default="1">

		<!--- Load this video --->
		<cfset data.video = model("video").findOneByID(ID=params.ID, returnAs="query")>
		
	</cffunction>

	<cffunction name="update">
	
		<cfif IsPost()>
		
			<!--- Find the country and update --->
			<cfset video = model("video").findOneByID(params.video.id)>
			<cfset updateResult = video.update(params.video)>
		
			<!--- Check the result --->
			<cfif updateResult EQ false>
				<cfset data.video = video>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="edit")>
			<cfelse>
				<cfset flashInsert(success="Video Updated Successfully")>
				<cfset redirectTo(controller="country", action="overview", params="ID=#video.countryID#")>
			</cfif>
			
		</cfif>

	</cffunction>

</cfcomponent>