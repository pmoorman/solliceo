# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("button_tooltip").tooltip(options)
	$('.needs_html_editor').wysihtml5()
	$('#new_application').on 'ajax:success', (event, xhr)->
		$('#application_form .modal-body').html(xhr.responseText)
	$('#new_application').on 'ajax:error', (event, xhr)->
		$('#application_form .modal-body').html(xhr.responseText)
		$('#application_form .modal-body .error:first input:first').focus()