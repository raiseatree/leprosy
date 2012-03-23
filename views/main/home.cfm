<cfoutput>
	<h1>Leprosy eliminated</h1>
	<h2>A photographic documentary</h2>
	#imageTag(source="world-map.png", id="map", class="map", usemap="##mapLinks")#
	
	<map id="mapHolder" name="mapLinks">
		<area class="usa mapArea" shape="poly" coords="66,64,67,109,44,111,7,132,1,122,14,115,1,69,17,59,33,58," alt="usa" title="United States of America" href="##" />	
		<area class="usa mapArea" shape="poly" coords="101,142,100,163,110,186,145,193,164,207,171,200,184,197,197,196,204,211,211,203,205,192,223,177,223,170,241,154,241,143,228,142,204,160,203,153,193,143,181,140,156,140,108,140," alt="usa" title="United States of America" href="##" />
		<area class="togo mapArea" shape="poly" coords="398,254,394,240,401,238,405,260," alt="togo" title="Togo" href="##" />
		<area class="nigeria mapArea" shape="poly" coords="403,255,412,260,435,242,431,234,409,233,404,252," alt="nigeria" title="Nigeria" href="##" />
		<area class="drc mapArea" shape="poly" coords="424,280,432,277,442,254,469,255,472,273,471,297,465,301,439,293,435,283," alt="drc" title="Democratic Republic of Congo" href="##" />
		<area class="nepal mapArea" shape="poly" coords="584,200,607,209,608,199,593,192,583,195," alt="nepal" title="Nepal" href="##" />
	</map>
	
	<div class="mapLayers">
		<span id="map-usa"><a href="##">USA</a></span>
		<span id="map-togo"><a href="##">Togo</a></span>
		<span id="map-nigeria"><a href="##">Nigeria</a></span>
		<span id="map-drc"><a href="##">Democratic Republic of Congo</a></span>
		<span id="map-nepal"><a href="##">Nepal</a></span>
	</div>
	
	<div class="mapText">Leprosy. Most of you have heard of it. But few really know about it. <span class="blue">Click on a country</span> as Tom documents those affected and involved around the world.</div>
	
	<nav class="bottomNav">
		<ul class="menuList">
			<li>#linkTo(controller="main", text="Home", class="selected")#</li>
			<li>#linkTo(controller="about", text="About")#</li>
			<li>#linkTo(controller="book", text="Book")#</li>
			<li class="last">#linkTo(controller="contact", text="Contact")#</li>
		</ul>
	</nav>
</cfoutput>