  $(function() {
    // 選択肢の変更を検知してイベントを発生させる。
    $('#material_user').change(function() {
      if ($("#material_user").val() === 'その他')
        $(".other_users-input").show();
      else
        $(".other_users-input").hide();
    });
  });
