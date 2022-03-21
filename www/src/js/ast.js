function checkallf01() {
  if ($("#checkall").is(':checked')) { 
    $("input[name=f01]").prop("checked", true);
  } else { 
    $("input[name=f01]").prop("checked", false);
  }
}