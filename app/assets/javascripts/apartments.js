var ready = function() {
  // Ausblenden des Suchformulars bei Initialisierung
  $('#form_request').hide();

  // Funktionsweise der Button Group zur Auswahl der Formulare
  $('.btn-group > .btn').click(function() {
    $('.btn-group > .btn').removeClass('active');
    return $(this).addClass('active');
  });


  $('#option_offer, #option_request').click(function() {
    if ($('#option_offer').hasClass('active')) {
      $('#form_offer').show();
      $('#form_request').hide();
      return false;
    } else {
      $('#form_offer').hide();
      $('#form_request').show();
    }
  });

};


// jQuery bietet ein spezielles Attribut, um zu prüfen, ob die Seite geladen ist
$(document).ready(ready);
$(document).on('page:load', ready);
