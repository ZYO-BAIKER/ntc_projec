import $ from 'jquery';
import 'select2';

$(function () {
  $('.js-searchable-multiple').select2({
    dropdownAutoWidth: true,
    theme: 'bootstrap5',
    allowClear: true,
    multiple: true
  });
});

$(document).ready(function () {
  let index = $("#add-row").data('index');

  $("#add-row").click(function () {
    // Remove select2 from all rows
    $('.js-searchable-multiple').each(function() {
      if ($.fn.select2 && $(this).data('select2')) {
        $(this).select2('destroy');
      }
    });

    let newRow = $("#attendance_" + index).clone().show();
    newRow.attr("id", "attendance_" + (index + 1));
    newRow.find('input, select').each(function() {
      // If the input or select element is not the one with class 'js-searchable-multiple'
      if (!$(this).hasClass('js-searchable-multiple')) {
        $(this).val('');  // reset the value
      }
      let name = $(this).attr('name').replace(/\[\d+\]/, '[' + (index + 1) + ']');
      $(this).attr('name', name);

      // Check if the element has an id attribute before trying to update it
      if ($(this).attr('id')) {
        let id = $(this).attr('id').replace(/\d+/, (index + 1));
        $(this).attr('id', id);
      }
    });


    $("#attendance-forms").append(newRow);
    index += 1;

    // Reapply select2 to all rows
    $('.js-searchable-multiple').select2({
      dropdownAutoWidth: true,
      theme: 'bootstrap5',
      allowClear: true,
      multiple: true
    });
  });

  $("form").on("submit", function() {
    $(this).find("tr").each(function() {
        if ($(this).css("display") === "none") {
            $(this).find("input, select").attr("disabled", "disabled");
        }
    });
  });
});
