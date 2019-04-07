function loadDoc() {
    var date=document.getElementById("daily_date").value;
    var shift=document.getElementById("farmer_shift").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "refresh.jsp?dailyDate="+date+"&shift="+shift, true);
    xhttp.send();
}