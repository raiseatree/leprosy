<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="home">
		
		<!--- Load all the countries --->
		<cfset data.country.usa = model("country").findOne(where="countryName='United States of America'", returnAs="query")>
		<cfset data.country.drc = model("country").findOne(where="countryName='Democratic Republic of Congo'", returnAs="query")>
		<cfset data.country.togo = model("country").findOne(where="countryName='Togo'", returnAs="query")>
		<cfset data.country.nepal = model("country").findOne(where="countryName='Nepal'", returnAs="query")>
		<cfset data.country.nigeria = model("country").findOne(where="countryName='Nigeria'", returnAs="query")>
	
		<!--- Add in which page we're on for the nav --->
		<cfset data.page = 'home'>
	
	</cffunction>

</cfcomponent>