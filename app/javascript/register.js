$(function() {
  $('[name="material[place]"]:radio').change( function() {
    if($('[id=material_place_現場]').prop('checked')){
      $('.other_places-input').show();
    }
    else if($('[id=material_place_車庫]').prop('checked')) {
      $('.other_places-input').hide();
    }
  });
});
