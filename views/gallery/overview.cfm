<cfparam name="data">
<cfoutput>

	<h2>#data.gallery.galleryName#</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			<cfif data.gallery.RecordCount GT 0>
				<!---><table>
					<tr>
						<th>##</th>
						<th>Gallery Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<cfloop query="data.galleries">
						<tr>
							<td>#CurrentRow#</td>
							<td>#linkTo(controller="gallery", action="overview", text=galleryName, params="ID=#ID#")#</td>
							<td>#linkTo(controller="gallery", action="edit", text=imageTag("edit.png"), params="ID=#ID#")#</td>
							<td>#linkTo(controller="gallery", action="delete", text=imageTag("delete.png"), params="ID=#ID#")#</td>
						</tr>
					</cfloop>
				</table>--->
			<cfelse>
				<p>Sorry - no photos found in this gallery</p>
			</cfif>
			
			<p>#linkTo(controller="gallery", action="upload", params="ID=#data.gallery.ID#", text="Add Photos")#</p><hr>
			
		</article>
	</section>	
	
</cfoutput>