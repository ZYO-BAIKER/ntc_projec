$(document).ready(function() {
  const $numberField = $("#vehicle_number");
  const $submitButton = $("#submit_button");

  // 初期状態の確認
  toggleSubmitButton();

  // 入力欄が変更されたときの処理
  $numberField.on("input", function() {
    toggleSubmitButton();
  });

  // ボタンの活性/非活性を切り替える関数
  function toggleSubmitButton() {
    if ($numberField.val().trim() === "") {
      $submitButton.prop("disabled", true); // 非活性化
    } else {
      $submitButton.prop("disabled", false); // 活性化
    }
  }
});
