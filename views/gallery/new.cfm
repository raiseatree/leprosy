<cfparam name="data">
<cfoutput>

	<h2>Add Gallery</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="add")#
			
				#includePartial("galleryForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Add Gallery")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>