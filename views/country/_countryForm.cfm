<cfoutput>

	#errorMessagesFor("data.country")#
	
	<p>#textField(objectName="data.country", property="countryName", label="Country Name", prepend="<br/>")#</p>

	#hiddenField(objectName="data.country", property="id")#
	
</cfoutput>