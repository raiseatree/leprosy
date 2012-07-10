<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<!--- Filter the edit action through the check login function --->
		<cfset filters(through="authenticateUser", only="edit,update")>
		
	</cffunction>

	<cffunction name="edit">
	
		<!--- Load the page content --->
		<cfset data.page = model("page").findOne(where="pageName = 'Book'")>
	
	</cffunction>

	<cffunction name="index">
	
		<!--- Load the about content --->
		<cfset data.content = model("page").findOneByPageName(pageName="Book", returnAs="query")>
		
		<!--- Set which page we're on for the bottom navigation --->
		<cfset data.page = 'book'>
	
	</cffunction>

	<cffunction name="update">
	
		<cfif IsPost()>
		
			<!--- Find the country and update --->
			<cfset page = model("page").findOneByID(params.page.id)>
			<cfset updateResult = page.update(params.page)>
		
			<!--- Check the result --->
			<cfif updateResult EQ false>
				<cfset data.page = page>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="edit")>
			<cfelse>
				<cfset flashInsert(success="Page Updated Successfully")>
				<cfset redirectTo(controller="admin", action="home")>
			</cfif>
			
		</cfif>

	</cffunction>

</cfcomponent>