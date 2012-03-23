<cfoutput>
<!doctype html>
<html>
	<head>
		#styleSheetLinkTag("global")#
		<script language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		#javaScriptIncludeTag("jquery.global,jquery.hoverintent")#
		
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