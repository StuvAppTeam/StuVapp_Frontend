var ready = function() {

		// Dropdown-Felder weisen einen Fehler aufgrund von turbolinks auf. Behebung durch diese Zeile
	 	$('.dropdown-toggle').dropdown();

		// Ausblenden des Suchformulars bei Initialisierung
		$('#search_form_blackboard').hide();

		// Funktionsweise der Button Group zur Auswahl der Formulare
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

    // Ganze Tabellenzeile als Link verwendbar
    $("tr[data-link]").click(function(){
        window.location = this.dataset.link;
    });

    // Step Menü
    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');

	};

	// jQuery bietet ein spezielles Attribut, um zu prüfen, ob die Seite geladen ist
	$(document).ready(ready);
	$(document).on('page:load', ready);
