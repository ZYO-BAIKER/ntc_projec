$(document).ready(function () {
  let index = $("#add-row").data('index');

  $("#add-row").click(function () {
    let newRow = $("#attendance_" + index).clone().show();
    newRow.attr("id", "attendance_" + (index + 1));
    newRow.find('input, select').each(function() {
      let name = $(this).attr('name').replace(/\[\d+\]/, '[' + (index + 1) + ']');
      $(this).attr('name', name);
    });
    $("#attendance-forms").append(newRow);
    index += 1;
  });

  $("form").on("submit", function() {
    $(this).find("tr").each(function() {
        if ($(this).css("display") === "none") {
            $(this).find("input, select").attr("disabled", "disabled");
        }
    });
  });
});
