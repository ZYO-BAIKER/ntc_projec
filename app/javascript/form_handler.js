$(document).ready(function () {
  // イベントリスナーの設定：フォームが送信されるときに実行されるイベントリスナーを設定。
  // つまり、ユーザーがフォームを送信しようとしたときにこのコードが実行される
  $("form").on("submit", function() {
    disableInputsForHiddenRows();
  });

  // 関数の定義と呼び出し： disableInputsForHiddenRows この関数は、表示されていない行のすべての入力と選択要素を無効にする。
  // フォームが送信される際にこの関数が呼び出される。
  function disableInputsForHiddenRows() {
    $("form").find("tr").each(function() {
      if ($(this).css("display") === "none") {
          $(this).find("input, select").attr("disabled", "disabled");
      }
    });
  }
});
