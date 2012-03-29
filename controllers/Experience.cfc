<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Run certain actions through the authentication --->
		<cfset filters(through="authenticateUser", except="view")>
	
	</cffunction>
	
	<cffunction name="add">
	
		<cfif IsPost()>
		
			<!--- Add the country --->
			<cfset addResult = model("experience").create(params.experience)>
		
			<!--- Check the result --->
			<cfif addResult.hasErrors()>
				<cfset data.country = model("country").findOneByID(params.experience.countryID)>
				<cfset data.experience = addResult>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="new")>
			<cfelse>
				<cfset flashInsert(success="Experience Added Successfully")>
				<cfset redirectTo(action="overview", params="ID=#addResult.ID#")>
			</cfif>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="delete">
	
		<!--- Find the country and update --->
		<cfset experience = model("experience").findOneByID(params.id)>
		<cfset deleteResult = experience.delete()>
	
		<!--- Check the result --->
		<cfif deleteResult EQ false>
			<cfset data.experience = experience>
			<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
			<cfset renderPage(template="overview")>
		<cfelse>
			<cfset flashInsert(success="Experience Deleted Successfully")>
			<cfset redirectTo(controller="country", action="overview", params="ID=#experience.countryID#")>
		</cfif>
		
	</cffunction>
	
	<cffunction name="edit">
	
		<cfif IsDefined("params.ID")>
			
			<!--- Load the country --->
			<cfset data.experience = model("experience").findOneByID(params.ID)>
			
		</cfif>
	
	</cffunction>
	
	<cffunction name="new">
		
		<cfset data.country = model("country").findOneByID(params.countryID)>
		<cfset data.experience = model("experience").new(countryID=data.country.ID)>
		
	</cffunction>

	<cffunction name="overview">
	
		<!--- Set the defauly page for paginated data --->
		<cfparam name="params.page" default="1">

		<!--- Load this experience --->
		<cfset data.experience = model("experience").findOneByID(ID=params.ID, returnAs="query")>
		
	</cffunction>

	<cffunction name="update">
	
		<cfif IsPost()>
		
			<!--- Find the country and update --->
			<cfset experience = model("experience").findOneByID(params.experience.id)>
			<cfset updateResult = experience.update(params.experience)>
		
			<!--- Check the result --->
			<cfif updateResult EQ false>
				<cfset data.experience = experience>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="edit")>
			<cfelse>
				<cfset flashInsert(success="Experience Updated Successfully")>
				<cfset redirectTo(controller="country", action="overview", params="ID=#experience.countryID#")>
			</cfif>
			
		</cfif>

	</cffunction>

</cfcomponent>