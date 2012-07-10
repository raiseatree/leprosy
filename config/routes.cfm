<cfset addRoute(name="home", pattern="", controller="main", action="home")>
<cfset addRoute(name="viewCountry", pattern="/country/[NAME]/[ID]/[CONTENT]", controller="country", action="view")>

<cfset addRoute(name="adminGallery", pattern="/gallery/overview/[ID]/[PAGE]", controller="gallery", action="overview")>