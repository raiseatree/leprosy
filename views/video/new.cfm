<cfparam name="data">
<cfoutput>

	<h2>Add Video</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="add")#
			
				#includePartial("videoForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Add Video")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>