$(function() {
  $("#material_all_count, #material_locations_attributes_0_usage_count, #material_locations_attributes_1_usage_count, #material_locations_attributes_2_usage_count, #material_repair_attributes_repair_count").keyup(function(){
    const num = parseInt($("#material_all_count").val() || 0);
    const site1 = parseInt($("#material_locations_attributes_0_usage_count").val() || 0);
    const site2 = parseInt($("#material_locations_attributes_1_usage_count").val() || 0);
    const site3 = parseInt($("#material_locations_attributes_2_usage_count").val() || 0);
    const repair = parseInt($("#material_repair_attributes_repair_count").val() || 0);

    $('#material_company_count').val(num - site1 - site2 - site3 - repair);
  });
});
