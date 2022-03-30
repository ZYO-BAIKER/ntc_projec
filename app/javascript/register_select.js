// case1
$(function() {
  // 「現場」選択時、現場入力欄表示
  $('#material_place').change(function() {
    if ($("#material_place").val() === '現場')
      $(".other_places-input").show();
    else
      $(".other_places-input").hide();
  });

  // 「修理中」選択時、修理中入力欄表示
  $('#material_place').change(function() {
    if ($("#material_place").val() === '修理中')
      $(".repair_request-input").show();
    else
      $(".repair_request-input").hide();
  });

  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user').change(function() {
    if ($("#material_user").val() === 'その他')
      $(".other_users-input").show();
    else
      $(".other_users-input").hide();
  });
});

// case2
$(function() {
  // 「現場」選択時、現場入力欄表示
  $('#material_place_2').change(function() {
    if ($("#material_place_2").val() === '現場')
      $(".other_places-input_2").show();
    else
      $(".other_places-input_2").hide();
  });

  // 「修理中」選択時、修理中入力欄表示
  $('#material_place_2').change(function() {
    if ($("#material_place_2").val() === '修理中')
      $(".repair_request-input_2").show();
    else
      $(".repair_request-input_2").hide();
  });

  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user_2').change(function() {
    if ($("#material_user_2").val() === 'その他')
      $(".other_users-input_2").show();
    else
      $(".other_users-input_2").hide();
  });
});

// case3
$(function() {
  // 「現場」選択時、現場入力欄表示
  $('#material_place_3').change(function() {
    if ($("#material_place_3").val() === '現場')
      $(".other_places-input_3").show();
    else
      $(".other_places-input_3").hide();
  });

  // 「修理中」選択時、修理中入力欄表示
  $('#material_place_3').change(function() {
    if ($("#material_place_3").val() === '修理中')
      $(".repair_request-input_3").show();
    else
      $(".repair_request-input_3").hide();
  });

  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user_3').change(function() {
    if ($("#material_user_3").val() === 'その他')
      $(".other_users-input_3").show();
    else
      $(".other_users-input_3").hide();
  });
});
