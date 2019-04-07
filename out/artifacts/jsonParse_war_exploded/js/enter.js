    $("*").keydown(function (event) {
            if (event.which == 13) {
                if (!$(this).hasClass("last")) {
                    event.preventDefault();
                    $(this).nextAll('input:first').focus();
                } else {
                    // alert("reached last");
                    $("#daily_submit").click();
                }
            }
        }
    );

    // $("#daily_submit").click(function (e) { 
        // e.preventDefault();
        // 
    // });