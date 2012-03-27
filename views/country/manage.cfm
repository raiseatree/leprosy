<cfparam name="data">
<cfoutput>

	<h2>View/Edit Countries</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			<cfif data.countries.RecordCount GT 0>
				<table>
					<tr>
						<th>##</th>
						<th>Country Name</th>
						<th>Edit</th>
					</tr>
					<cfloop query="data.countries">
						<tr>
							<td>#CurrentRow#</td>
							<td>#linkTo(action="overview", text=countryName, params="ID=#ID#")#</td>
							<td>#linkTo(action="edit", text=imageTag("edit.png"), params="ID=#ID#")#</td>
						</tr>
					</cfloop>
				</table>
			<cfelse>
				<p>Sorry - no countries currently available</p>
			</cfif>
		</article>
	</section>	
	
</cfoutput>