$(document).ready(function(){
  $('.toggle-form').click(function(){
    $(this).next('.card-body').toggle();
  });

  $('.toggle-location').click(function() {
    var locationNum = this.id.split('-')[2];
    $('.location-' + locationNum).css('display', function(i, display) {
      if (display == 'table-cell') {
        $('.show-button-' + locationNum).show(); // Show corresponding button
        return 'none';
      } else {
        $('.show-button-' + locationNum).hide(); // Hide corresponding button
        return 'table-cell';
      }
    });
  });

  $('.show-button-1').click(function() {
    $('.location-1').css('display', 'table-cell');
    $(this).hide(); // Hide this button
  });

  $('.show-button-2').click(function() {
    $('.location-2').css('display', 'table-cell');
    $(this).hide(); // Hide this button
  });

  $('.show-button-3').click(function() {
    $('.location-3').css('display', 'table-cell');
    $(this).hide(); // Hide this button
  });
});
