import $ from 'jquery';
import 'select2';

$(document).ready(function () {
  const FORMS_CONTAINER = '#attendance-forms';
  const ADD_ROW_BUTTON = '#add-row';
  const SELECT2_ELEMENTS = '.js-searchable-multiple';
  let rowIndex = $(ADD_ROW_BUTTON).data('index');

  function reapplySelect2(element) {
    $(element).select2({
      theme: 'bootstrap5',
      multiple: true,
      width: '100%'
    }).on('select2:opening', () => $('.select2-search__field').attr('readonly', true));
  }

  function resetSelect2(element) {
    if ($.fn.select2 && $(element).data('select2')) {
      $(element).select2('destroy');
    }
  }

  function adjustTextareaHeight(textareaElement) {
    $(textareaElement).height(0).height(textareaElement.scrollHeight);
  }

  function createAndAppendRow() {
    let newRow = $(`#attendance_${rowIndex}`).clone().show();
    newRow.attr("id", `attendance_${rowIndex + 1}`);

    newRow.find('input, select, textarea').each(function() {
      let isSelect2Multiple = $(this).hasClass('js-searchable-multiple');
      let isDateField = $(this).is('[name$="[date]"]');

      if (!isSelect2Multiple && !isDateField) $(this).val('');
      if (isSelect2Multiple) $(this).val([]);

      let updatedName = $(this).attr('name').replace(/\[\d+\]/, `[${rowIndex + 1}]`);
      $(this).attr('name', updatedName);

      if ($(this).attr('id')) {
        let updatedId = $(this).attr('id').replace(/\d+/, rowIndex + 1);
        $(this).attr('id', updatedId);
      }
    });

    $(FORMS_CONTAINER).append(newRow);
    rowIndex += 1;

    // Reset textarea contents and adjust their height
    newRow.find('textarea').val('').each(function() {
      adjustTextareaHeight(this);
    });
  }

  // Event listeners
  $(document).on('input', 'textarea', function () {
    adjustTextareaHeight(this);
  });

  $(ADD_ROW_BUTTON).click(function () {
    $(SELECT2_ELEMENTS).each((_, el) => resetSelect2(el));
    createAndAppendRow();
    $(SELECT2_ELEMENTS).each((_, el) => reapplySelect2(el));
  });

  // Initial actions
  $(SELECT2_ELEMENTS).each((_, el) => reapplySelect2(el));
  $('textarea').each((_, el) => adjustTextareaHeight(el));
});
