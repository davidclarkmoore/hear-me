$(document).ready(function() {
	$.fn.bootstrapSwitch.defaults.size = 'small';
	$.fn.bootstrapSwitch.defaults.onText = 'Yes';
	$.fn.bootstrapSwitch.defaults.offText = 'No';
	$.fn.bootstrapSwitch.defaults.onColor = 'success';
	$.fn.bootstrapSwitch.defaults.offColor = 'warning';
	$("input.checkbox-toggle").bootstrapSwitch();

	$("input.auto-change").on('switchChange.bootstrapSwitch', function(event, state) {
		$(this).closest("form").submit();
	});
});