$(function() {
  $('select[id^="material_locations_attributes_"][id$="_location_user"]').change(function() {
    const location_other_user_input = $(this).attr('id').replace("location_user", "location_other_user");
    if ($(this).val() === 'その他')
      $("#" + location_other_user_input).show();
    else
      $("#" + location_other_user_input).hide();
  });
});
