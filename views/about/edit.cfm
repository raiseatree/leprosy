<cfparam name="data">
<cfoutput>

	<h2>Edit About Page</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("aboutForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Page")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>