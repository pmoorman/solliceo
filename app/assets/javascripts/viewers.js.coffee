# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#add_file_form').hide()
	$("#new_file_button").click (e) ->
		e.preventDefault()
		$("#add_file_form").css('display', 'block')

	$('.best_in_place').best_in_place()
