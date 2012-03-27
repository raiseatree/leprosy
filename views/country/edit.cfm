<cfparam name="data">
<cfoutput>

	<h2>Edit Country</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="update")#
			
				#includePartial("countryForm")#
				
				<p>
					#submitTag(name="btnSubmit", value="Edit Country")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>