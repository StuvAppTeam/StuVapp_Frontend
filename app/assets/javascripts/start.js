$( document ).ready(function() {
	$("tr[data-link]").click(function() {
	    window.location = this.data("link")
	});
	
	$('#search_form_blackboard').hide();

	$('.btn-group > .btn').click(function() {
	  $('.btn-group > .btn').removeClass('active');
	  return $(this).addClass('active');
	});


	$('#option_wohnungsmarkt, #option_sbrett').click(function() {
	  if ($('#option_wohnungsmarkt').hasClass('active')) {
	    $('#search_form_apartment').show();
	    $('#search_form_blackboard').hide();
	    return false;
	  } else {
	    $('#search_form_apartment').hide();
	    $('#search_form_blackboard').show();
	  }
	});

});

