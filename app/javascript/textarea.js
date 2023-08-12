function adjustTextareaHeight(textareaElement) {
  $(textareaElement).height(0).height(textareaElement.scrollHeight);
}
// 入力時にtextareaの高さを調整
$(document).on('input', 'textarea', function () {
  adjustTextareaHeight(this);
});

// ページ読み込み時にも全てのtextareaの高さを調整
$(document).ready(function() {
  $('textarea').each(function() {
      adjustTextareaHeight(this);
  });
});
