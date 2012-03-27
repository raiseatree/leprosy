<cfparam name="data">
<cfoutput>

	<h2>Edit Gallery</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("galleryForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Gallery")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>