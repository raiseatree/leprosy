<cfparam name="data">
<cfoutput>

	<h1 class="textCentre">Administration</h1>
	<h2>Login Below</h2>

	#startFormTag(controller="user", action="login", class="loginForm")#
	
		#errorMessagesFor("data.user")#
	
		<p>#textField(objectName="data.user", property="email", label="E-Mail", prepend="<br/>")#</p>
		<p>#passwordField(objectName="data.user", property="password", label="Password", prepend="<br/>")#</p>
		<p>#submitTag(name="btnSubmit", value="Log In")#</p>
	
	#endFormTag()#
	
	#includePartial('/bottomNav')#
</cfoutput>