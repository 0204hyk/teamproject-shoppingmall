$("#all-check").click(function(){
    var chk = $("#all-check").prop("checked");
    if(chk) {
     $(".row-check").prop("checked", true);
    } else {
     $(".row-check").prop("checked", false);
    }
});

$(".row-check").click(function(){
    $("#all-check").prop("checked", false);
});