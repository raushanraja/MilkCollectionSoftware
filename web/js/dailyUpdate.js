function changeInfo(i) {
    $("#daily_submit").html("Save");
    $("input[name='Q']").attr('hidden', 'false');
    $("input[name='D']").attr('hidden', 'false');
    var id=["#edit-"+i+"> td:nth-child(3)","#edit-"+i+"> td:nth-child(5)","#edit-"+i+"> td:nth-child(6)"
        ,"#edit-"+i+"> td:nth-child(7)","#edit-"+i+"> td:nth-child(1)","#edit-"+i+"> td:nth-child(8)","#edit-"+i+"> td:nth-child(9)","#edit-"+i+"> td:nth-child(4)","#edit-"+i+"> td:nth-child(11)"];
    var Name=$(id[0]).html().trim();
    var Qty=$(id[1]).html().trim();
    var Fat=$(id[2]).html().trim();
    var Snf=$(id[3]).html().trim();
    var Sno=$(id[4]).html().trim();
    var Rate=$(id[5]).html().trim();
    var Amount=$(id[6]).html().trim();
    var Shift=$(id[7]).html().trim();
    var query='u';
    var daily_id=$(id[8]).html().trim();
    $("input[name='farmer_name']").val(Name);
    $("input[name='farmer_id']").val(i);
    $("input[name='qty']").val(Qty);
    $("input[name='fat']").val(Fat);
    $("input[name='snf']").val(Snf);
    $("input[name='MilkRate']").val(Rate);
    $("input[name='DailyAmount']").val(Amount);
    $("input[name='serial_no']").val(Sno);
    $("input[name='shift']").val(Shift);
    $("input[name='Q']").val(query);
    $("input[name='D']").val(daily_id);

}

