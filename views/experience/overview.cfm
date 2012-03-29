<cfparam name="data">
<cfoutput>
	
	<h2>#data.experience.experienceName#</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			<p>#linkTo(controller="country", action="overview", params="ID=#data.experience.countryID#", text="Back to Country")#</p>
			<hr>
			
			<div>#data.experience.content#</div>
			
			<hr>
			<p>#linkTo(controller="country", action="overview", params="ID=#data.experience.countryID#", text="Back to Country")#</p>
			
		</article>
	</section>	
	
</cfoutput>