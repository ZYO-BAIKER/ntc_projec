import $ from 'jquery';
import 'select2';

$(document).ready(function () {
  const FORMS_CONTAINER = '#attendance-forms';
  const ADD_ROW_BUTTON = '#add-row';
  const SELECT2_ELEMENTS = '.js-searchable-multiple';

  let rowIndex = $(ADD_ROW_BUTTON).data('index');

  reapplySelect2ToAllRows();

  $(ADD_ROW_BUTTON).click(function () {
    removeSelect2FromAllRows();
    createAndAppendRow();
    reapplySelect2ToAllRows();
  });

  $("form").on("submit", function() {
    disableInputsForHiddenRows();
  });

  function removeSelect2FromAllRows() {
    $(SELECT2_ELEMENTS).each(function() {
      if ($.fn.select2 && $(this).data('select2')) {
        $(this).select2('destroy');
      }
    });
  }

  function reapplySelect2ToAllRows() {
    $(SELECT2_ELEMENTS).select2({
      dropdownAutoWidth: true,
      theme: 'bootstrap5',
      allowClear: true,
      multiple: true
    });
  }

  function createAndAppendRow() {
    let newRow = $("#attendance_" + rowIndex).clone().show();

    newRow.attr("id", "attendance_" + (rowIndex + 1));
    newRow.find('input, select').each(function() {
      if (!$(this).hasClass('js-searchable-multiple')) {
        if (!$(this).is('[name$="[date]"]')) {
          $(this).val('');  // reset the value
        }
      } else {
        $(this).val([]);  // reset the value for multiple select elements
      }
      let name = $(this).attr('name').replace(/\[\d+\]/, '[' + (rowIndex + 1) + ']');
      $(this).attr('name', name);

      if ($(this).attr('id')) {
        let id = $(this).attr('id').replace(/\d+/, (rowIndex + 1));
        $(this).attr('id', id);
      }
    });

    $(FORMS_CONTAINER).append(newRow);
    rowIndex += 1;
  }

  function disableInputsForHiddenRows() {
    $("form").find("tr").each(function() {
      if ($(this).css("display") === "none") {
          $(this).find("input, select").attr("disabled", "disabled");
      }
    });
  }
});
