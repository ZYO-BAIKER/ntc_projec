$(function() {
  $("#material_all_count, #material_use_count, #material_use_count2, #material_use_count3, #material_repair_count").keyup(function(){
    const num = parseInt($("#material_all_count").val()|| 0);
    const site1 = parseInt($("#material_use_count").val()|| 0);
    const site2 = parseInt($("#material_use_count2").val()|| 0);
    const site3 = parseInt($("#material_use_count3").val()|| 0);
    const repair = parseInt($("#material_repair_count").val()|| 0);

    $('#material_company_count').val(num - site1 - site2 - site3 - repair);
  });
});
