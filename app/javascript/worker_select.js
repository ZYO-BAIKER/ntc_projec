import $ from 'jquery';
import 'select2';

$(function () {
  $('.js-searchable-multiple').select2({
    dropdownAutoWidth: true,
    theme: 'bootstrap5',
    placeholder: "作業員を選択",
    allowClear: true,
    multiple: true
  });
});
