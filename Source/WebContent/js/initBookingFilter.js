$(document).ready(function() {
	
	$('#fsFilterForm input').on('change', function() {

		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-flightNum') {
			$('#fsFilterDiv-flightNum').show();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').hide();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-departCode') {
			$('#fsFilterDiv-flightNum').hide();
			$('#fsFilterDiv-departCode').show();
			$('#fsFilterDiv-arriveCode').hide();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-arriveCode') {
			$('#fsFilterDiv-flightNum').hide();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').show();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-all') {
			$('#fsFilterDiv-flightNum').hide();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').hide();
		};

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
		
});