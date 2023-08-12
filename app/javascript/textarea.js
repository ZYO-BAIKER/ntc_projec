$(document).on('input', 'textarea', function () {
  $(this).height(0).height(this.scrollHeight);
});
