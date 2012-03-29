<cfparam name="data">
<cfoutput>

	<h2>Edit Experience</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("experienceForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Experience")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>