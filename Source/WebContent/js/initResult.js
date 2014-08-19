$(document).ready(function() {
	
	$('#showInfo1').click(function() {
		$('#1 .moreInfo').toggle();
		return false;
	});
	
	$('#showInfo2').click(function() {
		$('#2 .moreInfo').toggle();
		return false;
	});

	$(".headroom").headroom({
		"tolerance": 10,
		"offset": 50,
		"classes": {
			"initial": "animated",
			"pinned": "slideDown",
			"unpinned": "slideUp"
		}
	});
	
	$('.nivo').nivoLightbox();

});