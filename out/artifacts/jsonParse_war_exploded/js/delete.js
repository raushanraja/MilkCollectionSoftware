function deleteData(i) {
    var id = ["#edit-" + i + "> td:nth-child(3)", "#edit-" + i + "> td:nth-child(5)", "#edit-" + i + "> td:nth-child(6)", "#edit-" + i + "> td:nth-child(7)", "#edit-" + i + "> td:nth-child(1)", "#edit-" + i + "> td:nth-child(8)", "#edit-" + i + "> td:nth-child(9)", "#edit-" + i + "> td:nth-child(4)", "#edit-" + i + "> td:nth-child(11)"];
    var daily_id=$(id[8]).html().trim();
    var removeID="#edit-" + i
    console.log(daily_id);
    let URL = "delete"
    $.ajax({
        type: "GET",
        url: URL,
        data: "dailyID="+daily_id,
        dataType: "json",
        success: function (data) {
            $("#danger-alert p").html(data.message);
            showAlert();
            $(removeID).remove();

        }
    });
}

function showAlert() {
    $("#danger-alert").removeClass("d-none");
        $("#danger-alert").fadeTo(2000, 500).slideUp(500, function(){
       $("#danger-alert").slideUp(500);

        });   
    }