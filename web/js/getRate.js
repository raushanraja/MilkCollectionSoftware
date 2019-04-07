$("input:text").focus(function() { $(this).select(); } );
$("#farmer_fat , #farmer_snf, #farmer_qty").click(function (e) { 
    e.preventDefault();
    $(this).select();
    
});

$("#farmer_fat , #farmer_snf, #farmer_qty").focus(function (e) { 
    e.preventDefault();
    $(this).select();
    
});

$("#farmer_fat , #farmer_snf, #farmer_qty").change(function (e) { 
    e.preventDefault();
    let fat=$("#farmer_fat").val();
    let snf=$("#farmer_snf").val();
    let id= $("#farmer_id").val();
    let qty=$("#farmer_qty").val();
    let URL="getDaily.jsp?id="+id+"&fat="+fat+"&snf="+snf;
    $.ajax({
        type: "GET",
        url: URL,
        data: "data",
        dataType: "json",
        success: function (data) {
            let rate=data.MilkRate;
            $("#farmer_rate").val(data.MilkRate);
            $("#farmer_amount").val((Math.floor(rate*qty*100))/100);
            console.log((Math.floor(rate*qty*100))/100)    
        }
    });
    
});