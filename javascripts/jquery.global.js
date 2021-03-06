/* This document details site-wide jquery functions */
$(document).ready(function() {
	
	/*
	 * Hover over countries on the map, show the relevant country name
	 */
	$('.mapArea').hover(function() {
		// Hide all other regions currently showing (bug)
		$('.mapLayers span').fadeOut('fast');
		
		var country = '#map-' + $(this).attr('alt');
		$(country).fadeIn('fast');
	},function() {});
	
	/*
	 *  Show any notifications
	 */
	//showNotifications();

	/*
	 * Add a generic delete class to prompt the user in case they didn't want to click something
	 */
	$(".dave").click(function() {
		var answer = confirm("Are you sure you wish to delete that?");
		
		if (answer) return true
		else return false
	});

});

/*
 * Functions for showing the Flash messages to the user - message drops down from the top of the screen now
 */
function showNotifications() {

    var notification = $("#notification");

    // Make sure it's visible even when top of the page not visible
    notification.css("top", $(window).scrollTop());
    notification.css("width", $(document).width());

    //show the notification
    notification.slideDown("slow", function() {
        setTimeout(hideNotifications,
            10000 // 10 seconds
            )
    });
}


/*
 * Quick function to auto hide the flash messages after 10 secs
 */
function hideNotifications() {
    $("#notification").slideUp("slow");
}