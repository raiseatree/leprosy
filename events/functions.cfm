<cffunction name="GetEncryptKey">
	<cfreturn "sta675FTYYSsdWsaaT6">
</cffunction>

<cffunction name="GetServerRoot">
	<cfif CGI.SERVER_NAME EQ 'localhost'>
		<cfreturn 'http://' & CGI.HTTP_HOST & '/leprosy'>
	<cfelse>
		<cfreturn 'http://' & CGI.HTTP_HOST>
	</cfif>
</cffunction>