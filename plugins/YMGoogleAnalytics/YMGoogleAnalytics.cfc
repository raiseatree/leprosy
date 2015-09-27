<cfcomponent output="false" mixin="controller" hint="Provides an easy way to place Google Analytics on your site.">
	
	<cffunction name="init">
		<cfset this.version = "0.9.4">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="googleAnalyticsTag" access="public" returnType="string" output="false">
		<cfset var loc = {}>		
		<cfset loc.html  = "">
			
		<cfif StructKeyExists(application.wheels, "google.analytics.trackerId")>
			<cfset loc.trackerId = get("google.analytics.trackerId")>
		</cfif>
		
		<cfif StructKeyExists(loc, "trackerId")>
			<cfsavecontent variable="loc.html">
				<script type="text/javascript">
				var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
				document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
				</script>
				<script type="text/javascript">
				try {
				var pageTracker = _gat._getTracker("<cfoutput>#loc.trackerId#</cfoutput>");
				pageTracker._trackPageview();
				} catch(err) {}</script>
			</cfsavecontent>
		</cfif>
			
		<cfreturn loc.html>
	</cffunction>	
	
</cfcomponent>