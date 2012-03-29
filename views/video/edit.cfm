<cfparam name="data">
<cfoutput>

	<h2>Edit Video</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("videoForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Video")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>