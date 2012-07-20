<cfoutput>
	
	<h1 class="noQuestion">Contact us...</h1>
	
	<section class="staticPane">
		
		#data.content.content#
	
		<h3 class="fl">Book Reservation</h3>
		
		#startFormTag(controller="reservation", action="add", class="cb")#
		
			#errorMessagesFor("data.reservation")#
		
			<p>#textField(objectName="data.reservation", property="firstname", label="First Name", prepend="<br/>")#</p>
			<p>#textField(objectName="data.reservation", property="surname", label="Surname", prepend="<br/>")#</p>
			<p>#textField(objectName="data.reservation", property="email", label="Email", prepend="<br/>")#</p>
	
			<p>#submitTag(name="btnSubmit", value="Place Reservation")#</p>
	
		#endFormTag()#
		
	</section>
	
	#includePartial('/bottomNav')#
	
</cfoutput>