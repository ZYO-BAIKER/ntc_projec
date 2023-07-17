import $ from 'jquery';
import 'select2';

$(document).ready(function () {
  // Define some constants
  const FORMS_CONTAINER = '#attendance-forms';
  const ADD_ROW_BUTTON = '#add-row';
  const SELECT2_ELEMENTS = '.js-searchable-multiple';

  let index = $(ADD_ROW_BUTTON).data('index');

  // Function to remove select2 from all rows
  function removeSelect2FromAllRows() {
    $(SELECT2_ELEMENTS).each(function() {
      if ($.fn.select2 && $(this).data('select2')) {
        $(this).select2('destroy');
      }
    });
  }

  // Function to reapply select2 to all rows
  function reapplySelect2ToAllRows() {
    $(SELECT2_ELEMENTS).select2({
      dropdownAutoWidth: true,
      theme: 'bootstrap5',
      allowClear: true,
      multiple: true
    });
  }

  // Function to create a new row and append it to the form
  function createAndAppendRow() {
    let newRow = $("#attendance_" + index).clone().show();

    newRow.attr("id", "attendance_" + (index + 1));
    newRow.find('input, select').each(function() {
      if (!$(this).hasClass('js-searchable-multiple')) {
        if (!$(this).is('[name$="[date]"]')) {
          $(this).val('');  // reset the value
        }
      } else {
        $(this).val([]);  // reset the value for multiple select elements
      }
      let name = $(this).attr('name').replace(/\[\d+\]/, '[' + (index + 1) + ']');
      $(this).attr('name', name);

      if ($(this).attr('id')) {
        let id = $(this).attr('id').replace(/\d+/, (index + 1));
        $(this).attr('id', id);
      }
    });

    $(FORMS_CONTAINER).append(newRow);
    index += 1;
  }

  // Apply select2 to all rows at the beginning
  reapplySelect2ToAllRows();

  $(ADD_ROW_BUTTON).click(function () {
    removeSelect2FromAllRows();
    createAndAppendRow();
    reapplySelect2ToAllRows();
  });

  $("form").on("submit", function() {
    $(this).find("tr").each(function() {
      if ($(this).css("display") === "none") {
          $(this).find("input, select").attr("disabled", "disabled");
      }
    });
  });
});
