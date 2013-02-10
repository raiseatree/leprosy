<cfoutput>
	
	<h1 class="noQuestion">Contact us...</h1>
	
	<section class="staticPane xTall">
		
		#data.content.content#
	
		<h3 class="fl">Email Updates</h3>
		
		#startFormTag(controller="reservation", action="add", class="cb")#
		
			#errorMessagesFor("data.reservation")#
		
			<p>#textField(objectName="data.reservation", property="firstname", label="First Name", prepend="<br/>")#</p>
			<p>#textField(objectName="data.reservation", property="surname", label="Surname", prepend="<br/>")#</p>
			<p>#textField(objectName="data.reservation", property="email", label="Email", prepend="<br/>")#</p>
	
			<p>#submitTag(name="btnSubmit", value="Sign up for updates")#</p>
	
		#endFormTag()#
		
	</section>
	
	#includePartial('/bottomNav')#
	
</cfoutput>