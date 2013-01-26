<cfoutput>
	<h1>Leprosy eliminated</h1>
	<h2>And Other Stories</h2>
	#imageTag(source="world-map.png", id="map", class="map", usemap="##mapLinks")#
	
	<!--- Use http://www.image-maps.com --->
	<map id="mapHolder" name="mapLinks">
		<area class="ivorycoast mapArea" shape="poly" coords="380,260,379,251,373,246,366,252,377,264," href="/country/india/#data.country.ivorycoast.id#/photo" alt="ivorycoast" title="ivory coast"   />
		<area class="liberia mapArea" shape="poly" coords="376,249,376,237,391,241,391,263,383,263,380,257," href="/country/india/#data.country.liberia.id#/photo" alt="liberia" title="liberia"   />
		<area class="ghana mapArea" shape="poly" coords="390,242,390,263,399,259,398,239,394,241," href="/country/india/#data.country.ghana.id#/photo" alt="ghana" title="ghana" />
		<area class="usa mapArea" shape="poly" coords="66,64,67,109,44,111,7,132,1,122,14,115,1,69,17,59,33,58," alt="usa" title="United States of America" href="/country/india/#data.country.usa.id#/photo" />	
		<area class="usa mapArea" shape="poly" coords="101,142,100,163,110,186,145,193,164,207,171,200,184,197,197,196,204,211,211,203,205,192,223,177,223,170,241,154,241,143,228,142,204,160,203,153,193,143,181,140,156,140,108,140," alt="usa" title="United States of America" href="/country/india/#data.country.usa.id#/photo" />
		<area class="togo mapArea" shape="poly" coords="398,254,394,240,401,238,405,260," alt="togo" title="Togo" href="/country/india/#data.country.togo.id#/photo" />
		<area class="nigeria mapArea" shape="poly" coords="403,255,412,260,435,242,431,234,409,233,404,252," alt="nigeria" title="Nigeria" href="/country/india/#data.country.nigeria.id#/photo" />
		<area class="drc mapArea" shape="poly" coords="424,280,432,277,442,254,469,255,472,273,471,297,465,301,439,293,435,283," alt="drc" title="Democratic Republic of Congo" href="/country/india/#data.country.drc.id#/photo" />
		<area class="nepal mapArea" shape="poly" coords="584,200,607,209,608,199,593,192,583,195," alt="nepal" title="Nepal" href="/country/india/#data.country.nepal.id#/photo" />
		<area class="india mapArea" shape="poly" coords="583,254,611,217,631,200,618,191,608,204,600,205,584,202,586,190,586,172,569,182,557,209,581,256," href="/country/india/#data.country.india.id#/photo" alt="india" title="India" />
	</map>
	
	<div class="mapLayers">
		<span id="map-usa">#linkTo(route="viewCountry", NAME="united-states-of-america", ID=#data.country.usa.ID#, CONTENT="photo", text="USA")#</span>
		<span id="map-togo">#linkTo(route="viewCountry", NAME="togo", ID=#data.country.togo.ID#, CONTENT="photo", text="Togo")#</span>
		<span id="map-nigeria">#linkTo(route="viewCountry", NAME="nigeria", ID=#data.country.nigeria.ID#, CONTENT="photo", text="Nigeria")#</span>
		<span id="map-drc">#linkTo(route="viewCountry", NAME="democratic-republic-of-congo", ID=#data.country.drc.ID#, CONTENT="photo", text="Democratic Republic of Congo")#</span>
		<span id="map-nepal">#linkTo(route="viewCountry", NAME="nepal", ID=#data.country.nepal.ID#, CONTENT="photo", text="Nepal")#</span>
		<span id="map-ivorycoast">#linkTo(route="viewCountry", NAME="ivory-coast", ID=#data.country.ivorycoast.ID#, CONTENT="photo", text="Ivory Coast")#</span>
		<span id="map-liberia">#linkTo(route="viewCountry", NAME="liberia", ID=#data.country.liberia.ID#, CONTENT="photo", text="Liberia")#</span>
		<span id="map-ghana">#linkTo(route="viewCountry", NAME="ghana", ID=#data.country.ghana.ID#, CONTENT="photo", text="Ghana")#</span>
		<span id="map-india">#linkTo(route="viewCountry", NAME="india", ID=#data.country.india.ID#, CONTENT="photo", text="India")#</span>
	</div>
	
	<div class="mapText">Leprosy. Most of you have heard of it. But few really know about it. <span class="blue">Click on a country</span> as Tom documents those affected and involved around the world.</div>
	
	#includePartial('/bottomNav')#
</cfoutput>