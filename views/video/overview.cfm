<cfparam name="data">
<cfoutput>
	
	<h2>#data.video.videoName#</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			<p>#linkTo(controller="country", action="overview", params="ID=#data.video.countryID#", text="Back to Country")#</p>
			<hr>
			
			<!--- Display the video --->
			<iframe src="#data.video.url#" width="550" height="300" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
			
			<div>#data.video.description#</div>
			
			<hr>
			<p>#linkTo(controller="country", action="overview", params="ID=#data.video.countryID#", text="Back to Country")#</p>
			
		</article>
	</section>	
	
</cfoutput>