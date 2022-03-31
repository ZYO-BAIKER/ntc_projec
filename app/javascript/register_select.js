// 現場1
$(function() {
  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user').change(function() {
    if ($("#material_user").val() === 'その他')
      $(".other_users-input").show();
    else
      $(".other_users-input").hide();
  });
});

// 現場2
$(function() {
  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user2').change(function() {
    if ($("#material_user2").val() === 'その他')
      $(".other_users-input2").show();
    else
      $(".other_users-input2").hide();
  });
});

// 現場3
$(function() {
  // 「その他」選択時、その他使用者の入力欄表示
  $('#material_user3').change(function() {
    if ($("#material_user3").val() === 'その他')
      $(".other_users-input3").show();
    else
      $(".other_users-input3").hide();
  });
});
