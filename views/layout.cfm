<cfoutput>
<!doctype html>
<html>
	<head>
		#styleSheetLinkTag("global")#
		<script language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		#javaScriptIncludeTag("jquery.global,jquery.hoverintent,jquery.galleria")#
		
		<!--[if lt IE 9]>
			<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>
		<section id="main">
			#includeContent()#
		</section>
		
		<!--- Display any flash messages --->
		<div id="notification" class="notification <cfif flashKeyExists('success')>success<cfelseif flashKeyExists('error')>error</cfif>">
			<span id="notification-text"><cfif flashKeyExists("success")>#flash("success")#<cfelseif flashKeyExists("error")>#flash("error")#</cfif></span>
		</div>
		
		#googleAnalyticsTag()#
	</body>
</html>
</cfoutput>