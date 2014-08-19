$(document).ready(function() {
	
	// Headroom
	$(".headroom").headroom({
		"tolerance": 10,
		"offset": 50,
		"classes": {
			"initial": "animated",
			"pinned": "slideDown",
			"unpinned": "slideUp"
		}
	});
	
	// booking.jsp
	// Datepicker
	$('#departDate').Zebra_DatePicker({
		// direction: true,
		pair: $('#returnDate'),
		format: 'Y-m-d'
	});

	$('#returnDate').Zebra_DatePicker({
		direction: 1,
		format: 'Y-m-d'
	});
	
	// Slider
	$('#slider').nivoSlider({
		effect: 'fade',              	 // Specify sets like: 'fold,fade,sliceDown'
	    animSpeed: 2000,                 // Slide transition speed
	    pauseTime: 5000,         		// How long each slide will show
	    startSlide: 0,                  // Set starting Slide (0 index)
	    directionNav: false,             // Next & Prev navigation
	    controlNav: false,               // 1,2,3... navigation
	    controlNavThumbs: false,        // Use thumbnails for Control Nav
	    pauseOnHover: false,             // Stop animation while hovering
	    manualAdvance: false,           // Force manual transitions
	    prevText: 'Prev',               // Prev directionNav text
	    nextText: 'Next',               // Next directionNav text
	    randomStart: false,             // Start on a random slide
	    beforeChange: function(){},     // Triggers before a slide transition
	    afterChange: function(){},      // Triggers after a slide transition
	    slideshowEnd: function(){},     // Triggers after all slides have been shown
	    lastSlide: function(){},        // Triggers when last slide is shown
	    afterLoad: function(){}         // Triggers when slider has loaded
	});
	
	// Responsive radio buttons
	$('#search input').on('change', function() {

		if ($('input[name=triptype]:checked', '#search').val() == 'oneway') {
			$('#returnDate').hide();
			$('#returnLabel').hide();
			$('#returnDate').data('Zebra_DatePicker').destroy();
		};

		if ($('input[name=triptype]:checked', '#search').val() == 'return') {
			$('#returnDate').show();
			$('#returnLabel').show();
			$('#returnDate').Zebra_DatePicker({
				direction: 1,
				format: 'Y-m-d'
			});
		};

	});
	
	// login.html
	$("#username").focus();

});