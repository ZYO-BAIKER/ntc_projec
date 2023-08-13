$(document).ready(function() {
  $('#groupSelector').on('change', function() {
    const selectedGroup = $(this).val();

    $('tbody tr').each(function() {
      const group = $(this).data('group');
      if (selectedGroup === "" || group === selectedGroup) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
});
