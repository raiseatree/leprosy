<cfparam name="data">
<cfoutput>
	
	<h1 class="noQuestion">About...</h1>
	
	<ul class="subHeadings">
		<li><a href="##introduction">Introduction</a></li>
		<li><a href="##theproject">The Project</a></li>
		<li><a href="##thedisease">The Disease</a></li>
		<li><a href="##thephotographer">The Photographer</a></li>
		<li class="last"><a href="##thesponsors">The Sponsors</a></li>
	</ul>
	
	<section class="staticPane">#data.content.content#</section>
	
	#includePartial('/bottomNav')#
	
</cfoutput>