$(function() {
  // 「その他」選択時、その他使用者の入力欄表示
  $('.user_select').change(function() {
    const id = $(this).attr('id');
    const other_users_input = "#" + id.replace("user_name_id", "other_users");
    if ($(this).val() === '18') // 'その他'のidが18だと仮定
      $(other_users_input).show();
    else
      $(other_users_input).hide();
  });
});
