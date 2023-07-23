import $ from 'jquery';
import 'select2';

$(document).ready(function () {
  // 定数の定義： FORMS_CONTAINER、ADD_ROW_BUTTON、SELECT2_ELEMENTS はページ内の特定の要素を参照するためのセレクタ。
  // rowIndex は新しい行を追加するためのインデックス。
  const FORMS_CONTAINER = '#attendance-forms';
  const ADD_ROW_BUTTON = '#add-row';
  const SELECT2_ELEMENTS = '.js-searchable-multiple';
  let rowIndex = $(ADD_ROW_BUTTON).data('index');

  // すべての行にSelect2を適用
  function reapplySelect2ToAllRows() {
    $(SELECT2_ELEMENTS).select2({
      theme: 'bootstrap5',
      multiple: true,
      width: '100%'
    }).on('select2:opening', function(e) {
      // ここで検索フィールドを読み取り専用に設定
      $('.select2-search__field').attr('readonly', true);
    });
  }

  // すべての行からSelect2を削除
  function removeSelect2FromAllRows() {
    $(SELECT2_ELEMENTS).each(function() {
      if ($.fn.select2 && $(this).data('select2')) {
        $(this).select2('destroy');
      }
    });
  }

  //新しい行を作成し、フォームに追加
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

  // イベントリスナーの設定： $(ADD_ROW_BUTTON).click は "Add Row" ボタンがクリックされたときのイベントリスナー。
  // ボタンがクリックされたとき、すべての行からSelect2を削除し、新しい行を作成して追加し、すべての行に再度Select2を適用。
  $(ADD_ROW_BUTTON).click(function () {
    removeSelect2FromAllRows();
    createAndAppendRow();
    reapplySelect2ToAllRows();
  });

  // 初期アクションの実行： これはページが読み込まれたときに最初に行われるアクション。
  // ここでは、ページが読み込まれたときにすべての行にSelect2を適用しています。
  reapplySelect2ToAllRows();
});
