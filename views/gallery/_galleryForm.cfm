<cfoutput>

	#javascriptIncludeTag(source="/tiny_mce/tiny_mce.js", head="true")# 
	
	<script type="text/javascript"> 
		tinyMCE.init({
			// General options
			mode : "textareas",
			theme : "advanced",
			plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
	 
			// Theme options
			theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,|,sub,sup",
			theme_advanced_buttons3 : "tablecontrols,|,code,fullscreen",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,
	 
			// Example content CSS (should be your site CSS)
			content_css : "global-s.css",
	 
			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",
	 
			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	</script> 

	#errorMessagesFor("data.gallery")#
	
	<p>#textField(objectName="data.gallery", property="galleryName", label="Gallery Name", prepend="<br/>")#</p>
	<p>#textArea(objectName="data.gallery", property="description", label="Description", prepend="<br/>")#</p>

	#hiddenField(objectName="data.gallery", property="id")#
	#hiddenField(objectName="data.gallery", property="countryID")#
	
</cfoutput>