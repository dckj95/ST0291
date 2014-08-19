$(document).ready(function() {

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
	
	$('#imageEditCheck').click(function () {
	    $(".imageEdit").toggle(this.checked);
	});

});