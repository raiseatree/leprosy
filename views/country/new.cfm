<cfparam name="data">
<cfoutput>

	<h2>Add Country</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="add")#
			
				#includePartial("countryForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Add Country")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>