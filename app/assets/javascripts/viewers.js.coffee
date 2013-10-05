# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	# best in place
	$('.best_in_place').best_in_place()
	
	# show tooltip
	$(".button_tooltip").tooltip()

	# Edit buttons for profile image
	$(".edit_button").hide()
	$(".edit_area").hover (->
		$(this).find(".edit_button").fadeIn 100
	), ->
		$(this).find(".edit_button").fadeOut 100

