/* This document details site-wide jquery functions */
$(document).ready(function() {
	
	/*
	 * Hover over countries on the map, show the relevant country name
	 */
	$('.mapArea').hoverIntent(function() {
		// Hide all other regions currently showing (bug)
		$('.mapLayers span').fadeOut('fast');
		
		var country = '#map-' + $(this).attr('alt');
		$(country).fadeIn('fast');
	},function() {});
	
});