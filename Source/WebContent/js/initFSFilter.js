$(document).ready(function() {
	
	$('#fsFilterForm input').on('change', function() {

		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-aircraftModel') {
			$('#fsFilterDiv-aircraftModel').show();
			$('#fsFilterDiv-departDate').hide();
			$('#fsFilterDiv-arriveDate').hide();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').hide();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-departDate') {
			$('#fsFilterDiv-aircraftModel').hide();
			$('#fsFilterDiv-departDate').show();
			$('#fsFilterDiv-arriveDate').hide();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').hide();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-departCode') {
			$('#fsFilterDiv-aircraftModel').hide();
			$('#fsFilterDiv-departDate').hide();
			$('#fsFilterDiv-arriveDate').hide();
			$('#fsFilterDiv-departCode').show();
			$('#fsFilterDiv-arriveCode').hide();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-arriveCode') {
			$('#fsFilterDiv-aircraftModel').hide();
			$('#fsFilterDiv-departDate').hide();
			$('#fsFilterDiv-arriveDate').hide();
			$('#fsFilterDiv-departCode').hide();
			$('#fsFilterDiv-arriveCode').show();
		};
		
		if ($('input[name=fsFilter]:checked', '#fsFilterForm').val() == 'fsFilter-all') {
			$('#fsFilterDiv-aircraftModel').hide();
			$('#fsFilterDiv-departDate').hide();
			$('#fsFilterDiv-arriveDate').hide();
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