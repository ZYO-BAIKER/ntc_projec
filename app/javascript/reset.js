$(function(){
  $(".clearForm").bind("click", function(){
      $(this.form).find("#material_period_start, #material_period_end").val("");
  });
  $(".clearForm2").bind("click", function(){
    $(this.form).find("#material_period_start2, #material_period_end2").val("");
  });
  $(".clearForm3").bind("click", function(){
    $(this.form).find("#material_period_start3, #material_period_end3").val("");
  });
});
