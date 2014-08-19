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

	$('#departDate').Zebra_DatePicker({
		direction: true,
		format: 'Y-m-d'
	});

	$('#arriveDate').Zebra_DatePicker({
		direction: true,
		format: 'Y-m-d'
	});
		
});