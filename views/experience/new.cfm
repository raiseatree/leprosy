<cfparam name="data">
<cfoutput>

	<h2>Add Experience</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="add")#
			
				#includePartial("experienceForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Add Experience")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>