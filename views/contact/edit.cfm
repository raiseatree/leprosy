<cfparam name="data">
<cfoutput>

	<h2>Edit Contact Page</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("contactForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Page")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>