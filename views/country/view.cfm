<cfparam name="data">
<cfoutput>
	
	<cfif data.params.content EQ 'photo'>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$('ul.gallery_demo').galleria({
					history   : false, // activates the history object for bookmarking, back-button etc.
					clickNext : true, // helper for making the image clickable
					insert    : '##main_image', // the containing selector for our main image
					onImage   : function(image,caption,thumb) {
						
						// fade in the image & caption
						image.css('display','none').fadeIn(1000);
						caption.css('display','none').fadeIn(1000);
						
						// fetch the thumbnail container
						var _li = thumb.parents('li');
						
						// fade out inactive thumbnail
						_li.siblings().children('img.selected').fadeTo(500,0.3);
						
						// fade in active thumbnail
						thumb.fadeTo('fast',1).addClass('selected');
						
						// add a title for the clickable image
						image.attr('title','Next image >>');
					},
					onThumb : function(thumb) { // thumbnail effects goes here
						
						// fetch the thumbnail container
						var _li = thumb.parents('li');
						
						// if thumbnail is active, fade all the way.
						var _fadeTo = _li.is('.active') ? '1' : '0.3';
						
						// fade in the thumbnail when finished loading
						thumb.css({display:'none',opacity:_fadeTo}).fadeIn(1500);
						
						// hover effects
						thumb.hover(
							function() { thumb.fadeTo('fast',1); },
							function() { _li.not('.active').children('img').fadeTo('fast',0.3); } // don't fade out if the parent is active
						)
					}
				});
				
			});
		</script>
	</cfif>
		
	<header id="countryHeader">
		<h2>#data.country.countryName#</h2>
		<cfif IsDefined("data.content.contentName")><h3>#data.content.contentName#</h3></cfif>
		<ul>
			<li>
				<cfif data.params.content EQ 'photo'>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="photo", text="Photography", class="selected")#
				<cfelse>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="photo", text="Photography")#
				</cfif>
			</li>
			<li>
				<cfif data.params.content EQ 'video'>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="video", text="Videos", class="selected")#
				<cfelse>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="video", text="Videos")#
				</cfif>
			</li>
			<li class="last">
				<cfif data.params.content EQ 'experience'>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="experience", text="Experiences", class="selected")#
				<cfelse>
					#linkTo(route="viewCountry", NAME="#data.params.name#", ID="#data.params.ID#", CONTENT="experience", text="Experiences")#
				</cfif>
			</li>
		</ul>
	</header>
	
	<section id="contentMain">
	
		
		<!--- Photography Gallery Content --->
		<cfif IsDefined("data.content") AND data.params.content EQ 'photo'>
			<div id="main_image"></div>

			<div id="photoNav" class="cl"> 
				<a href="##" onclick="$.galleria.prev(); return false;" class="fl">
					#imageTag("arrow-left.png")#
				</a> 
				<a href="##" onclick="$.galleria.next(); return false;" class="fr">
					#imageTag("arrow-right.png")#
				</a>
			</div>

		
			<div class="cb fl">
				<ul class="gallery_demo">
					<cfloop query="data.content">
						<cfif CurrentRow EQ 1>
							<cfif findNoCase(CGI.HTTP_HOST,'.co') EQ 0>
								<li class="active"><img src="/leprosy/miscellaneous/#contentID#/#filename#" title="<cfif caption GT ''>#caption#<cfelse>&nbsp;</cfif>"></li>
							<cfelse>
								<li class="active"><img src="/miscellaneous/#contentID#/#filename#" title="<cfif caption GT ''>#caption#<cfelse>&nbsp;</cfif>"></li>
							</cfif>
						<cfelse>
							<cfif findNoCase(CGI.HTTP_HOST,'.co') EQ 0>
								<li><img src="/leprosy/miscellaneous/#contentID#/#filename#" title="<cfif caption GT ''>#caption#<cfelse>&nbsp;</cfif>"></li>
							<cfelse>
								<li><img src="/miscellaneous/#contentID#/#filename#" title="<cfif caption GT ''>#caption#<cfelse>&nbsp;</cfif>"></li>
							</cfif>
						</cfif>
					</cfloop>
				</ul>
			</div>
			
		<!--- Vimeo video --->
		<cfelseif IsDefined("data.content") AND data.params.content EQ 'video'>
			
			<!--- Display the video --->
			<iframe src="#data.content.url#" width="550" height="300" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
			
		<cfelseif IsDefined("data.content") AND data.params.content EQ 'experience'>
		
		</cfif>
	
	</section>
	
	<aside id="contentAside">
		
		<ul class="galleryList">
			<cfloop query="data.galleries">
				<li <cfif contentID EQ data.content.contentID>class="selected"</cfif>>#linkTo(route="viewCountry", NAME="#data.params.name#", ID=#data.params.id#, CONTENT="#data.params.content#", params="contentID=#contentID#", text="#contentName#")#</li>
			</cfloop>
		</ul>
		
		<cfif IsDefined("data.content")><div class="galleryDesc">#data.content.description#</div></cfif>
		
	</aside>
	
	
	
	#includePartial('/bottomNav')#
</cfoutput>