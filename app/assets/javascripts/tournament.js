$(document).on('turbolinks:load', function() {
  $('#search_course').click(function() {
		$('#golf_search').toggle('show');
		$('#golf_enter').toggle(false);
	});
	
	$('#enter_course').click(function() {
		$('#golf_enter').toggle('slow');
		$('#golf_search').toggle(false);
	});
	
	$('#reg_date_button').click(function() {
		$('#reg_date').toggle('slow');
	});
	
	$('#host_button').click(function() {
		$('#add_host').toggle('slow');
		$('#create_host').toggle(false);
		$('#host_field').value('value', false);
	});
	
	$('#create_host_button').click(function() {
		
		$('#create_host').toggle('slow');
		$('#add_host').toggle(false);
		$('#host_field').value('value', true);
	});
	
	$('#search_button').click(function() {
		$.ajax({
			url: '/tournaments/update_courses',
			data: { search_value: $('#search_value').val() },
			dataType: 'script'
		})
	});
	
});