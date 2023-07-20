$(document).ready(function() {
  $('#show_button').click(function(e) {
    e.preventDefault();
    const selectedDate = $('#show_date').val();
    window.location.href = '/attendances/show_date?date=' + selectedDate;
  });

  $('#new_button').click(function(e) {
    e.preventDefault();
    const selectedDate = $('#new_date').val();
    window.location.href = '/attendances/new?date=' + selectedDate;
  });
});
