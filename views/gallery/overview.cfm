<cfparam name="data">
<cfoutput>
	
	#javascriptIncludeTag("jquery.jeditable.min")#
	
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			 * Make the captions editable (in admin)
			 */
			$('.edit').editable('/photo/update');
			//$('.edit').editable('index.cfm?controller=photo&action=update');
		});
	</script>

	<h2>#data.gallery.galleryName#</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			<p>#linkTo(controller="gallery", action="upload", params="ID=#data.gallery.ID#", text="Add Photos")#</p><hr>
			
			<cfif data.photos.RecordCount GT 0>
				<ul class="adminPhotoList">
					<cfloop query="data.photos">
						<li><img src="#GetServerRoot()#/miscellaneous/#data.photos.galleryID#/#data.photos.filename#" width="100"/><br /><span id="#data.photos.ID#" class="edit"><cfif data.photos.caption GT ''>#data.photos.caption#<cfelse>[Edit Caption]</cfif></span>#linkTo(controller="photo", action="delete", params="id=#data.photos.id#", text=imageTag(source='delete.png', class='inline'))#</li>
					</cfloop>
				</ul>
				
				<div class="cb"></div>
				
				#paginationLinks(prepend="<div class='pagination'>Page: ", append="</div>", classForCurrent="selected", route="adminGallery", ID=data.photos.galleryID)#
			<cfelse>
				<p>Sorry - no photos found in this gallery</p>
			</cfif>
			
		</article>
	</section>	
	
</cfoutput>