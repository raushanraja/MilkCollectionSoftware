<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <%
        try {


            session = request.getSession(false);
            if (session.getAttribute("username").toString().equalsIgnoreCase("admin2") ) {
                Connection con=DBServices.getConnection();
                PreparedStatement preparedStatement = con.prepareStatement("SELECT dr.*, fi.farmer_name FROM daily_register as dr, farmer_info as fi  where dr.farmer_id = fi.farmer_id and date=? and shift=? ORDER BY Serial_no DESC ");
                preparedStatement.setString(1,session.getAttribute("date").toString());
                preparedStatement.setString(2,session.getAttribute("shift").toString());

                ResultSet resultSet = preparedStatement.executeQuery();
    %>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Daily Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fa5/css/all.css">
    <link rel="stylesheet" href="css/mdb.css">
    <link rel="stylesheet" href="css/addons/datatables.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <!-- <link rel="stylesheet" href="css/styleA.css"> -->
    <style>

        .form-row > .card-group > .card{
            -webkit-box-shadow: unset;
            box-shadow: unset;
            background: none;

        }

        .card-body{
            border-right: 1px white solid;
        }

        .card-header{
            font-size: 1.1rem;
        }

        input[type='number'] {
            -moz-appearance:textfield;
        }

        input[value]{

        }

        /* Webkit browsers like Safari and Chrome */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* for equal width of prepent-text  */

        .input-group>.input-group-prepend {
            flex: 0 0 22%;
        }
        .input-group .input-group-text {
            width: 100%;
        }

    </style>

</head>

<body >
<nav class="navbar navbar-expand-sm  blue lighten-1" style="background-color: #e3f2fd;">
    <!-- CUST_NAME -->
    <span class="navbar-brand  border border-white rounded px-2 ml-3 text-white" style=" font-size: 30px" href="#"><strong>हवासपुर महिला दुग्ध उत्पादक सहयोग समिति </strong></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExample03">
        <div class="navbar-nav mr-auto"></div>
        <form action="logout" class="form-inline my-2 my-md-0">
            <button type="submit" class="btn btn-lg btn-orange">Logout</button>
        </form>
    </div>
</nav>

<div class="container-fluid mt-2">
    <form id="form" method="GET" action="insertData">

        <div class="card rgba-teal-strong">
            <div class="card-body ">
                <div class="form-row mb-3">
                    <div class="col-sm text-white text-center mx-3"><strong>S.no</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Name</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Shift</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Date</strong></div>
                </div>
                <div class="form-row hr-light pt-3 px-5">
                    <input  name="serial_no"    id="serial_no"     type="number"  class="col-sm form-control mx-3"  placeholder="S.No"  min="0" value="<%=session.getAttribute("sno")%>" >
                    <input  name="farmer_name"  id="farmer_name"   type="text"    class="col-sm form-control mx-3"  placeholder="Farmer Name" readonly >
                    <select name="shift"        id="shift"                        class="col-sm form-control mx-3"               onchange="loadDoc()">
                        <option id="opt1" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Morning")) out.print("selected");%> style="font-size:1.1rem">Morning</option>
                        <option id="opt2" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Evening")) out.print("selected");%> style="font-size:1.1rem">Evening</option>
                    </select>
                    <input name="dailyDate"     id="dailyDate"    type="date"       class="col-sm form-control mx-3"    value="<%=session.getAttribute("date")%>" onchange="loadDoc();" >
                    <input name="Q"             id="Q"            type="text"   hidden="true"    class=" col-sm form-control mx-3"    value="i">
                    <input name="D"             id="D"            type="number" hidden="true"    class=" col-sm form-control mx-3"    value="0">
                </div>
            </div>
        </div>
        <div class="card rgba-teal-strong">
            <div class="card-body ">
                <div class="form-row mb-3">
                    <div class="col-sm text-white text-center mx-2"><strong>Code</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Qty.</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Fat</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Snf</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Milk Rate</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong></strong>Amount</div>
                    <div class="col-sm text-white text-center mx-2"><strong></strong>Insert</div>
                </div>
                <div class="form-row hr-light pt-3 p-5">
                    <input name="farmer_id"    id="farmer_id"    type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Farmer ID" >
                    <input name="qty"          id="qty"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk Quantity">
                    <input name="fat"          id="fat"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk Fat">
                    <input name="snf"          id="snf"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk snf">
                    <input name="MilkRate"     id="MilkRate"     type="text"  class="col-sm  form-control mx-2 border border-info"      placeholder="Milk Rate" >
                    <input name="DailyAmount"  id="DailyAmount"  type="text"  class="col-sm  form-control mx-2 border border-info last"     placeholder="Total Amount" >
                    <button type="submit" class="btn-send btn btn-primary my-0">Insert Data</button>
                </div>
            </div>
        </div>
    </form>
    <div class="row mt-5">
        <div class="col">
            <div class="col-md-12">
                <div class="col  rounded">

                    <div class=" row  rounded  badge rgba-teal-strong d-block">
                        <table id=dtBasicExample class='table bg-white text-dark table-striped table-bordered'>
                            <thead>
                            <tr>
                                <th class='th-sm'>S.No
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>ID
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th><th class='th-sm'>Name
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                                <th class='th-sm'>Shift
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Qty/Kg
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Fat
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Snf
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Rate
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Amount
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th>Edit</th>
                                <th class='th-sm d-none'>dailyID
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <% while (resultSet.next()){%>
                            <tr id="edit-<%=resultSet.getInt("farmer_id")%>">
                                <td style=font-size:1.1rem;><%=resultSet.getInt("Serial_no")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getInt("farmer_id")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("farmer_name")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("shift")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("qty")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("fat")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("snf")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("MilkRate")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("DailyAmount")%></td>
                                <td style="font-size:1.1rem;" class="text-center view overlay zoomIn">
                                    <a onclick="changeInfo(<%=resultSet.getInt("farmer_id")%>)">
                                        <i class="fa text-info fa-edit"></i>
                                        <div class="mask flex-center info-color">
                                            <i class="fa text-white fa-edit"></i>
                                        </div>
                                    </a>
                                </td>
                                <td class="d-none" style=font-size:1.1rem;><%=resultSet.getInt("daily_Id")%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <%} else {
                        out.println("Session invalid");
                    }}catch (Exception e){
                        out.println(" <script>\n" +
                                " var msg='Please Login to access" +
                                "'" +
                                " </script>");
                        RequestDispatcher rd;
                        rd = request.getRequestDispatcher("index.jsp");
                        rd.include(request, response);
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src=js/jquery.min.js></script>
<script type='text/javascript' src=js/popper.min.js></script>
<script type='text/javascript' src=js/bootstrap.min.js></script>
<script type='text/javascript' src=js/mdb.min.js></script>
<script type='text/javascript' src=js/addons/datatables.js></script>
<script type='text/javascript' src=js/addons/buttons.flash.min.js></script>
<script type='text/javascript' src=js/addons/buttons.html5.min.js></script>
<script type='text/javascript' src=js/addons/buttons.print.min.js></script>
<script type='text/javascript' src=js/addons/dataTables.buttons.min.js></script>
<script type='text/javascript' src=js/addons/jszip.min.js></script>
<script type='text/javascript' src=js/addons/pdfmake.min.js></script>
<script type='text/javascript' src=js/addons/vfs_fonts.js></script>
<script>
    $(document).ready(function() {

        // Focues on farmerID Input filed

        $('input').keypress(function(event) {

            if(event.which == 13) {
                if(!$(this).hasClass("last")){
                    event.preventDefault();
                    $(this).nextAll('input:first').focus();
                    multiply();
                }else {
                    $("form").submit();
                }
            }

        });

        $(function(){
            $("#farmer_id").focus();
        });

        $('#dtBasicExample').DataTable( {
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "order": [[ 0, "desc" ]],
            dom:  "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"+
                "<'row'<'col-sm-12'B>>",
            buttons: [

                { extend: 'copy', className: 'btn btn-primary glyphicon glyphicon-duplicate' },
                { extend: 'csv', className: 'btn btn-primary glyphicon glyphicon-save-file' },
                { extend: 'excel', className: 'btn btn-primary glyphicon glyphicon-list-alt' },
                { extend: 'pdf', className: 'btn btn-primary glyphicon glyphicon-file',
                    exportOptions: {
                        columns: ':visible'
                    },
                    customize: function (doc) {
                        doc.content[1].table.widths =
                            Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                    }},
                { extend: 'print', className: 'btn btn-primary glyphicon glyphicon-print',
                }
            ]
        } );

        // Farmer id KEY PRESS DOWN AND UP for getting adata from database
        // $("#farmer_id").keydown(function(){
        //     $("#farmer_id").css("background-color", "grey");
        // });

        $("#farmer_id").keyup(function() {
            var id=document.getElementById("farmer_id").value;
            var fat=document.getElementById("fat").value;
            var snf=document.getElementById("snf").value;
            var urls = "getDaily.jsp?id="+id+"&fat="+fat+"&snf="+snf;
            var xmlhttp;
            var my_JSON_object = {};
            if (window.XMLHttpRequest) {

                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        my_JSON_object = JSON.parse(xmlhttp.responseText);
                        if (my_JSON_object.name !=null){
                            document.getElementById("farmer_name").value = my_JSON_object.name;
                            // document.getElementById("fat").value = my_JSON_object.fat;
                            // document.getElementById("snf").value = my_JSON_object.snf;
                            // document.getElementById("MilkRate").value = my_JSON_object.MilkRate;
                        }
                        else {
                            document.getElementById("farmer_name").value = null;
                            document.getElementById("qty").value =null;
                            document.getElementById("fat").value = 0;
                            document.getElementById("snf").value = 0;
                            document.getElementById("MilkRate").value = 0;
                            document.getElementById("DailyAmount").value = 0;

                        }
                    } else {
                        // alert("HTTP error " + xmlhttp.status + ": " + xmlhttp.statusText);
                        document.getElementById("farmer_name").value = null;
                        document.getElementById("qty").value =null;
                        document.getElementById("fat").value = 0;
                        document.getElementById("snf").value = 0;
                        document.getElementById("MilkRate").value = 0;
                        document.getElementById("DailyAmount").value = 0;
                    }
                }

            }

            xmlhttp.open("GET", urls);
            xmlhttp.send();

        });


        $("#snf").keyup(function() {
            var id=document.getElementById("farmer_id").value;
            $("#farmer_id").css("background-color", "white");
            var fat=document.getElementById("fat").value;
            var snf=document.getElementById("snf").value;
            var urls = "getDaily.jsp?id="+id+"&fat="+fat+"&snf="+snf;
            var xmlhttp;
            var my_JSON_object = {};
            if (window.XMLHttpRequest) {

                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        my_JSON_object = JSON.parse(xmlhttp.responseText);
                        if (my_JSON_object.name !=null){
                            document.getElementById("MilkRate").value = my_JSON_object.MilkRate;
                            var rate= parseFloat(my_JSON_object.MilkRate);
                            var qunatity=parseFloat(document.getElementById("qty").value);
                            document.getElementById("DailyAmount").value = (qunatity*rate).toFixed(2);

                        }
                        else {
                            document.getElementById("snf").value = 0;
                            document.getElementById("MilkRate").value = 0;
                            document.getElementById("DailyAmount").value = null;

                        }
                    } else {
                        // alert("HTTP error " + xmlhttp.status + ": " + xmlhttp.statusText);
                        document.getElementById("MilkRate").value = 0;
                        document.getElementById("DailyAmount").value = 0;
                    }
                }

            }

            xmlhttp.open("GET", urls);
            xmlhttp.send();

        });


    } );

</script>

<script>
    function multiply(){
        var qunatity=parseFloat((document.getElementById("qty").value));
        var rate = parseFloat(document.getElementById("MilkRate").value);
        document.getElementById("DailyAmount").value = parseFloat((qunatity*rate).toFixed(2));

    }
</script>
<script>
    function loadDoc() {
        var date=document.getElementById("dailyDate").value;
        var shift=document.getElementById("shift").value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                location.reload();
            }
        };
        xhttp.open("GET", "refresh.jsp?dailyDate="+date+"&shift="+shift, true);
        xhttp.send();
    }
</script>

<%--Changing Data--%>
<script>
    function changeInfo(i) {
        $(".btn-send").html("Save");
        $("input[name='Q']").attr('hidden', 'false');
        $("input[name='D']").attr('hidden', 'false');
        var id=["#edit-"+i+"> td:nth-child(3)","#edit-"+i+"> td:nth-child(5)","#edit-"+i+"> td:nth-child(6)"
            ,"#edit-"+i+"> td:nth-child(7)","#edit-"+i+"> td:nth-child(1)","#edit-"+i+"> td:nth-child(8)","#edit-"+i+"> td:nth-child(9)","#edit-"+i+"> td:nth-child(4)","#edit-"+i+"> td:nth-child(11)"];
        var Name=$(id[0]).html();
        var Qty=$(id[1]).html();
        var Fat=$(id[2]).html();
        var Snf=$(id[3]).html();
        var Sno=$(id[4]).html();
        var Rate=$(id[5]).html();
        var Amount=$(id[6]).html();
        var Shift=$(id[7]).html();
        var query='u';
        var daily_id=$(id[8]).html();
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

        // document.getElementById("#pp").innerHTML="Hello";
        // $("input[name='farmer_name']").val(Name);
        // $("input[name='farmer_name']").val(Qty);
        // $("input[name='farmer_name']").val(Fat);
        // $("input[name='farmer_name']").val(Snf);

        // var urls = "getcustomer.jsp?id=" + i;
        // var Http = new XMLHttpRequest();
        // Http.open("GET", urls);
        // Http.send();

    }

</script>


<%-- <script>
    function insertData(){
        const url="insertData"
        const http= new XMLHttpRequest();
        http.onreadystatechange=function(){
            if(http.status===200 && http.readyState===4){
                
            }
        }
    } --%>

<%--// </script>--%>
</body>

</html><%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <%
        try {


            session = request.getSession(false);
            if (session.getAttribute("username").toString().equalsIgnoreCase("admin2") ) {
                Connection con=DBServices.getConnection();
                PreparedStatement preparedStatement = con.prepareStatement("SELECT dr.*, fi.farmer_name FROM daily_register as dr, farmer_info as fi  where dr.farmer_id = fi.farmer_id and date=? and shift=? ORDER BY Serial_no DESC ");
                preparedStatement.setString(1,session.getAttribute("date").toString());
                preparedStatement.setString(2,session.getAttribute("shift").toString());

                ResultSet resultSet = preparedStatement.executeQuery();
    %>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Daily Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fa5/css/all.css">
    <link rel="stylesheet" href="css/mdb.css">
    <link rel="stylesheet" href="css/addons/datatables.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <!-- <link rel="stylesheet" href="css/styleA.css"> -->
    <style>

        .form-row > .card-group > .card{
            -webkit-box-shadow: unset;
            box-shadow: unset;
            background: none;

        }

        .card-body{
            border-right: 1px white solid;
        }

        .card-header{
            font-size: 1.1rem;
        }

        input[type='number'] {
            -moz-appearance:textfield;
        }

        input[value]{

        }

        /* Webkit browsers like Safari and Chrome */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* for equal width of prepent-text  */

        .input-group>.input-group-prepend {
            flex: 0 0 22%;
        }
        .input-group .input-group-text {
            width: 100%;
        }

    </style>

</head>

<body >
<nav class="navbar navbar-expand-sm  blue lighten-1" style="background-color: #e3f2fd;">
    <!-- CUST_NAME -->
    <span class="navbar-brand  border border-white rounded px-2 ml-3 text-white" style=" font-size: 30px" href="#"><strong>हवासपुर महिला दुग्ध उत्पादक सहकारी समिति </strong></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarsExample03">
        <div class="navbar-nav mr-auto"></div>
        <form action="logout" class="form-inline my-2 my-md-0">
            <button type="submit" class="btn btn-lg btn-orange">Logout</button>
        </form>
    </div>
</nav>

<div class="container-fluid mt-2">
    <form id="form" method="GET" action="insertData">

        <div class="card rgba-teal-strong">
            <div class="card-body m-0 p-0">
                <div class="form-row">
                    <div class="col-sm text-white text-center mx-3"><strong>S.no</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Name</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Shift</strong></div>
                    <div class="col-sm text-white text-center mx-3"><strong>Date</strong></div>
                </div>
                <div class="form-row hr-light pt-3 px-5">
                    <input  name="serial_no"    id="serial_no"     type="number"  class="col-sm form-control mx-3"  placeholder="S.No"  min="0" value="<%=session.getAttribute("sno")%>" >
                    <input  name="farmer_name"  id="farmer_name"   type="text"    class="col-sm form-control mx-3"  placeholder="Farmer Name" readonly >
                    <select name="shift"        id="shift"                        class="col-sm form-control mx-3"               onchange="loadDoc()">
                        <option id="opt1" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Morning")) out.print("selected");%> style="font-size:1.1rem">Morning</option>
                        <option id="opt2" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Evening")) out.print("selected");%> style="font-size:1.1rem">Evening</option>
                    </select>
                    <input name="dailyDate"     id="dailyDate"    type="date"       class="col-sm form-control mx-3"    value="<%=session.getAttribute("date")%>" onchange="loadDoc();" >
                    <input name="Q"             id="Q"            type="text"   hidden="true"    class=" col-sm form-control mx-3"    value="i">
                    <input name="D"             id="D"            type="number" hidden="true"    class=" col-sm form-control mx-3"    value="0">
                </div>
            </div>
        </div>
        <div class="card rgba-teal-strong">
            <div class="card-body ">
                <div class="form-row mb-3">
                    <div class="col-sm text-white text-center mx-2"><strong>Code</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Qty.</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Fat</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Snf</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong>Milk Rate</strong></div>
                    <div class="col-sm text-white text-center mx-2"><strong></strong>Amount</div>
                    <div class="col-sm text-white text-center mx-2"><strong></strong>Insert</div>
                </div>
                <div class="form-row hr-light pt-3 p-5">
                    <input name="farmer_id"    id="farmer_id"    type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Farmer ID" >
                    <input name="qty"          id="qty"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk Quantity">
                    <input name="fat"          id="fat"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk Fat">
                    <input name="snf"          id="snf"          type="text"  class="col-sm  form-control mx-2 border border-info"     placeholder="Milk snf">
                    <input name="MilkRate"     id="MilkRate"     type="text"  class="col-sm  form-control mx-2 border border-info"      placeholder="Milk Rate" >
                    <input name="DailyAmount"  id="DailyAmount"  type="text"  class="col-sm  form-control mx-2 border border-info last"     placeholder="Total Amount" >
                    <button type="submit" class="btn-send btn btn-primary my-0">Insert Data</button>
                </div>
            </div>
        </div>
    </form>
    <div class="row mt-5">
        <div class="col">
            <div class="col-md-12">
                <div class="col  rounded">

                    <div class=" row  rounded  badge rgba-teal-strong d-block">
                        <table id=dtBasicExample class='table bg-white text-dark table-striped table-bordered'>
                            <thead>
                            <tr>
                                <th class='th-sm'>S.No
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>ID
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th><th class='th-sm'>Name
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                                <th class='th-sm'>Shift
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Qty/Kg
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Fat
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Snf
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Rate
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Amount
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th>Edit</th>
                                <th class='th-sm d-none'>dailyID
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <% while (resultSet.next()){%>
                            <tr id="edit-<%=resultSet.getInt("farmer_id")%>">
                                <td style=font-size:1.1rem;><%=resultSet.getInt("Serial_no")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getInt("farmer_id")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("farmer_name")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("shift")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("qty")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("fat")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("snf")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getFloat("MilkRate")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("DailyAmount")%></td>
                                <td style="font-size:1.1rem;" class="text-center view overlay zoomIn">
                                    <a onclick="changeInfo(<%=resultSet.getInt("farmer_id")%>)">
                                        <i class="fa text-info fa-edit"></i>
                                        <div class="mask flex-center info-color">
                                            <i class="fa text-white fa-edit"></i>
                                        </div>
                                    </a>
                                </td>
                                <td class="d-none" style=font-size:1.1rem;><%=resultSet.getInt("daily_Id")%></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <%} else {
                        out.println("Session invalid");
                    }}catch (Exception e){
                        out.println(" <script>\n" +
                                " var msg='Please Login to access" +
                                "'" +
                                " </script>");
                        RequestDispatcher rd;
                        rd = request.getRequestDispatcher("index.jsp");
                        rd.include(request, response);
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src=js/jquery.min.js></script>
<script type='text/javascript' src=js/popper.min.js></script>
<script type='text/javascript' src=js/bootstrap.min.js></script>
<script type='text/javascript' src=js/mdb.min.js></script>
<script type='text/javascript' src=js/addons/datatables.js></script>
<script type='text/javascript' src=js/addons/buttons.flash.min.js></script>
<script type='text/javascript' src=js/addons/buttons.html5.min.js></script>
<script type='text/javascript' src=js/addons/buttons.print.min.js></script>
<script type='text/javascript' src=js/addons/dataTables.buttons.min.js></script>
<script type='text/javascript' src=js/addons/jszip.min.js></script>
<script type='text/javascript' src=js/addons/pdfmake.min.js></script>
<script type='text/javascript' src=js/addons/vfs_fonts.js></script>
<script>
    $(document).ready(function() {

        // Focues on farmerID Input filed

        $('input').keypress(function(event) {

            if(event.which == 13) {
                if(!$(this).hasClass("last")){
                    event.preventDefault();
                    $(this).nextAll('input:first').focus();
                    multiply();
                }else {
                    $("form").submit();
                }
            }

        });

        $(function(){
            $("#farmer_id").focus();
        });

        $('#dtBasicExample').DataTable( {
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "order": [[ 0, "desc" ]],
            dom:  "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"+
                "<'row'<'col-sm-12'B>>",
            buttons: [

                { extend: 'copy', className: 'btn btn-primary glyphicon glyphicon-duplicate' },
                { extend: 'csv', className: 'btn btn-primary glyphicon glyphicon-save-file' },
                { extend: 'excel', className: 'btn btn-primary glyphicon glyphicon-list-alt' },
                { extend: 'pdf', className: 'btn btn-primary glyphicon glyphicon-file',
                    exportOptions: {
                        columns: ':visible'
                    },
                    customize: function (doc) {
                        doc.content[1].table.widths =
                            Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                    }},
                { extend: 'print', className: 'btn btn-primary glyphicon glyphicon-print',
                }
            ]
        } );

        // Farmer id KEY PRESS DOWN AND UP for getting adata from database
        // $("#farmer_id").keydown(function(){
        //     $("#farmer_id").css("background-color", "grey");
        // });

        $("#farmer_id").keyup(function() {
            var id=document.getElementById("farmer_id").value;
            var fat=document.getElementById("fat").value;
            var snf=document.getElementById("snf").value;
            var urls = "getDaily.jsp?id="+id+"&fat="+fat+"&snf="+snf;
            var xmlhttp;
            var my_JSON_object = {};
            if (window.XMLHttpRequest) {

                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        my_JSON_object = JSON.parse(xmlhttp.responseText);
                        if (my_JSON_object.name !=null){
                            document.getElementById("farmer_name").value = my_JSON_object.name;
                            // document.getElementById("fat").value = my_JSON_object.fat;
                            // document.getElementById("snf").value = my_JSON_object.snf;
                            // document.getElementById("MilkRate").value = my_JSON_object.MilkRate;
                        }
                        else {
                            document.getElementById("farmer_name").value = null;
                            document.getElementById("qty").value =null;
                            document.getElementById("fat").value = 0;
                            document.getElementById("snf").value = 0;
                            document.getElementById("MilkRate").value = 0;
                            document.getElementById("DailyAmount").value = 0;

                        }
                    } else {
                        // alert("HTTP error " + xmlhttp.status + ": " + xmlhttp.statusText);
                        document.getElementById("farmer_name").value = null;
                        document.getElementById("qty").value =null;
                        document.getElementById("fat").value = 0;
                        document.getElementById("snf").value = 0;
                        document.getElementById("MilkRate").value = 0;
                        document.getElementById("DailyAmount").value = 0;
                    }
                }

            }

            xmlhttp.open("GET", urls);
            xmlhttp.send();

        });


        $("#snf").keyup(function() {
            var id=document.getElementById("farmer_id").value;
            $("#farmer_id").css("background-color", "white");
            var fat=document.getElementById("fat").value;
            var snf=document.getElementById("snf").value;
            var urls = "getDaily.jsp?id="+id+"&fat="+fat+"&snf="+snf;
            var xmlhttp;
            var my_JSON_object = {};
            if (window.XMLHttpRequest) {

                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        my_JSON_object = JSON.parse(xmlhttp.responseText);
                        if (my_JSON_object.name !=null){
                            document.getElementById("MilkRate").value = my_JSON_object.MilkRate;
                            var rate= parseFloat(my_JSON_object.MilkRate);
                            var qunatity=parseFloat(document.getElementById("qty").value);
                            document.getElementById("DailyAmount").value = (qunatity*rate).toFixed(2);

                        }
                        else {
                            document.getElementById("snf").value = 0;
                            document.getElementById("MilkRate").value = 0;
                            document.getElementById("DailyAmount").value = null;

                        }
                    } else {
                        // alert("HTTP error " + xmlhttp.status + ": " + xmlhttp.statusText);
                        document.getElementById("MilkRate").value = 0;
                        document.getElementById("DailyAmount").value = 0;
                    }
                }

            }

            xmlhttp.open("GET", urls);
            xmlhttp.send();

        });


    } );

</script>

<script>
    function multiply(){
        var qunatity=parseFloat((document.getElementById("qty").value));
        var rate = parseFloat(document.getElementById("MilkRate").value);
        document.getElementById("DailyAmount").value = parseFloat((qunatity*rate).toFixed(2));

    }
</script>
<script>
    function loadDoc() {
        var date=document.getElementById("dailyDate").value;
        var shift=document.getElementById("shift").value;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                location.reload();
            }
        };
        xhttp.open("GET", "refresh.jsp?dailyDate="+date+"&shift="+shift, true);
        xhttp.send();
    }
</script>

<%--Changing Data--%>
<script>
    function changeInfo(i) {
        $(".btn-send").html("Save");
        $("input[name='Q']").attr('hidden', 'false');
        $("input[name='D']").attr('hidden', 'false');
        var id=["#edit-"+i+"> td:nth-child(3)","#edit-"+i+"> td:nth-child(5)","#edit-"+i+"> td:nth-child(6)"
            ,"#edit-"+i+"> td:nth-child(7)","#edit-"+i+"> td:nth-child(1)","#edit-"+i+"> td:nth-child(8)","#edit-"+i+"> td:nth-child(9)","#edit-"+i+"> td:nth-child(4)","#edit-"+i+"> td:nth-child(11)"];
        var Name=$(id[0]).html();
        var Qty=$(id[1]).html();
        var Fat=$(id[2]).html();
        var Snf=$(id[3]).html();
        var Sno=$(id[4]).html();
        var Rate=$(id[5]).html();
        var Amount=$(id[6]).html();
        var Shift=$(id[7]).html();
        var query='u';
        var daily_id=$(id[8]).html();
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

        // document.getElementById("#pp").innerHTML="Hello";
        // $("input[name='farmer_name']").val(Name);
        // $("input[name='farmer_name']").val(Qty);
        // $("input[name='farmer_name']").val(Fat);
        // $("input[name='farmer_name']").val(Snf);

        // var urls = "getcustomer.jsp?id=" + i;
        // var Http = new XMLHttpRequest();
        // Http.open("GET", urls);
        // Http.send();

    }

</script>


<%-- <script>
    function insertData(){
        const url="insertData"
        const http= new XMLHttpRequest();
        http.onreadystatechange=function(){
            if(http.status===200 && http.readyState===4){

            }
        }
    } --%>

<%--// </script>--%>
</body>

</html>