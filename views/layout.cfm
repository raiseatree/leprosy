<cfoutput>
<!doctype html>
<html>
	<head>
		#styleSheetLinkTag(sources="global")#
		
		<!--[if lt IE 9]>
			<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>
		<section id="main">
			<cfoutput>#includeContent()#</cfoutput>
		</section>
	</body>
</html>
</cfoutput>