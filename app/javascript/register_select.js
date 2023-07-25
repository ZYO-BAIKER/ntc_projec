$(function() {
  $('select[id^="material_locations_attributes_"][id$="_user"]').change(function() {
    const other_users_input = $(this).attr('id').replace("user", "other_users");
    if ($(this).val() === 'その他')
      $("#" + other_users_input).show();
    else
      $("#" + other_users_input).hide();
  });
});
