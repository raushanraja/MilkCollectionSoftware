const farmerID=     $("#farmer_id");
const farmerName=   $("#farmer_name");
const farmerShift=  $("#farmer_shift");
const farmerSerial= $("#farmer_sno");
const farmerQty=    $("#farmer_qty");
const farmerFat=    $("#farmer_fat");
const farmerSnf=    $("#farmer_snf");
const farmerRate=   $("#farmer_rate");
const farmerAmount= $("#farmer_amount");
const dailySnf=     $("#daily_snf");
const dailyRate=    $("#daily_rate");
const dailyAmount=  $("#daily_amount");
const dailyDate=    $("#daily_date");
farmerID.click(function (e) { 
    farmerID.val("");   
});
farmerID.change(function (e) { 
    e.preventDefault();
    // alert("changed")
    $.ajax({
        type: "GET",
        url: 'getName.jsp?id='+farmerID.val(),
        data: "names",
        dataType: "json",
        success: function (names) {
            farmerName.val(names.name);
            // console.log("Clicked");
            // console.log(names.name);
        }
    });
}); 
