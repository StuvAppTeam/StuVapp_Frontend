# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('.btn-group > .btn').click ->
    	$('.btn-group > .btn').removeClass 'active'
    	$(this).addClass 'active'
	
	
	$('#option_wohnungsmarkt, #option_sbrett').click ->
		if $('#option_wohnungsmarkt').hasClass('active')
			$('#search_form_apartment').show()
			$('#search_form_blackboard').hide()
			return false
		else
			$('#search_form_apartment').hide()
			$('#search_form_blackboard').show()
			return
	return