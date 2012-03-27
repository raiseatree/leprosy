<cfparam name="data">
<cfoutput>

	<h2>#data.country.countryName#</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			<h2 class="textLeft">Photo Galleries</h2>
			
			<cfif data.galleries.RecordCount GT 0>
				<table>
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
				</table>
			<cfelse>
				<p>Sorry - no photo galleries currently available</p>
			</cfif>
			
			<p>#linkTo(controller="gallery", action="new", params="countryID=#data.country.ID#", text="Add Photo Gallery")#</p><hr>
			
			<h2 class="textLeft">Video Galleries</h2>
			<cfif data.videos.RecordCount GT 0>
				<table>
					<tr>
						<th>##</th>
						<th>Video Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<cfloop query="data.videos">
						<tr>
							<td>#CurrentRow#</td>
							<td>#linkTo(controller="video", action="overview", text=videoName, params="ID=#ID#")#</td>
							<td>#linkTo(controller="video", action="edit", text=imageTag("edit.png"), params="ID=#ID#")#</td>
							<td>#linkTo(controller="video", action="delete", text=imageTag("delete.png"), params="ID=#ID#")#</td>
						</tr>
					</cfloop>
				</table>
			<cfelse>
				<p>Sorry - no video galleries currently available</p>
			</cfif>
			
			<p>#linkTo(controller="video", action="new", params="countryID=#data.country.ID#", text="Add Video Gallery")#</p><hr>
			
			<h2 class="textLeft">Experiences</h2>
			<cfif data.experiences.RecordCount GT 0>
				<table>
					<tr>
						<th>##</th>
						<th>Experience Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<cfloop query="data.experiences">
						<tr>
							<td>#CurrentRow#</td>
							<td>#linkTo(controller="experience", action="overview", text=experienceName, params="ID=#ID#")#</td>
							<td>#linkTo(controller="experience", action="edit", text=imageTag("edit.png"), params="ID=#ID#")#</td>
							<td>#linkTo(controller="experience", action="delete", text=imageTag("delete.png"), params="ID=#ID#")#</td>
						</tr>
					</cfloop>
				</table>
			<cfelse>
				<p>Sorry - no experiences currently available</p>
			</cfif>
			
			<p>#linkTo(controller="experience", action="new", params="countryID=#data.country.ID#", text="Add Experience")#</p>
		</article>
	</section>	
	
</cfoutput>