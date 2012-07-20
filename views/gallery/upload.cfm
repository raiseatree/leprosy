<cfparam name="data">
<cfoutput>
	
	#javascriptIncludeTag("fileuploader")#
	#stylesheetLinkTag("fileuploader")#

	<h2>#data.gallery.galleryName# - Photo Upload</h2>
	
	<section id="admin">
		#includePartial("/admin/adminMenu")#
	
		<article id="content">
			
			#startFormTag(action="processUpload")#
			
				<div id="file-uploader-demo1">		
					<noscript>			
						<p>Please enable JavaScript to use file uploader.</p>
						<!-- or put a simple form for upload here -->
					</noscript>         
				</div>
				
				<script>        
			        function createUploader(){            
			            var uploader = new qq.FileUploader({
			                element: document.getElementById('file-uploader-demo1'),
			                action: '/miscellaneous/photo-uploader.cfc',
			                allowedExtensions: ['jpg', 'jpeg'],
							params: {method: 'Upload'}
			            });           
			        }
			        
			        // in your app create uploader as soon as the DOM is ready
			        // don't wait for the window to load  
			        window.onload = createUploader;     
			    </script>
				
				<p>
					#hiddenFieldTag(name="ID", value=data.gallery.ID)#
					#submitTag(name="btnSubmit", value="Process Photos")#
				</p>
			
			#endFormTag()#
			
		</article>
	</section>	
	
</cfoutput>