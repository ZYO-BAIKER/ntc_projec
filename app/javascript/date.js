$(document).ready(function() {
  $('#show_button').click(function(e) {
    e.preventDefault();
    var selectedDate = $('#date').val();
    console.log(selectedDate);
    window.location.href = '/attendances/show_date?date=' + selectedDate;
  });
});
