<cfcomponent extends="Controller" output="false">
	
	<cffunction name="add">
	
		<cfif IsPost()>
		
			<!--- Add the country --->
			<cfset addResult = model("reservation").create(params.reservation)>
		
			<!--- Check the result --->
			<cfif addResult.hasErrors()>
				<cfset data.content = model("page").findOneByPageName(pageName="Contact", returnAs="query")>
				<cfset data.reservation = addResult>
				<cfset flashInsert(error="Sorry - an error occurred - see below for details")>
				<cfset renderPage(template="/contact/home")>
			<cfelse>
			
				<!--- Mail Tom --->
				<cfset sendEmail(to="andystephenson88@gmail.com", from="hello@isleprosyeliminated.com", template="signup", name="#params.reservation.firstName# #params.reservation.surname#", email=params.reservation.email)>
			
				<cfset flashInsert(success="Reservation Added Successfully")>
				<cfset redirectTo(controller="contact", action="sent")>
			</cfif>
			
		</cfif>
	
	</cffunction>
	
</cfcomponent>