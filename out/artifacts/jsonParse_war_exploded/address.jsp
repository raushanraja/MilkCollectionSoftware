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
            http://localhost:8080/address.jsp

        session = request.getSession(false);
        if (session.getAttribute("username").toString().equalsIgnoreCase("admin2") ) {
            Connection con=DBServices.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM farmer_info ORDER BY farmer_id ASC");
            ResultSet resultSet = preparedStatement.executeQuery();
    %>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Address Book</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fa5/css/all.css">
    <link rel="stylesheet" href="css/mdb.css">
    <link rel="stylesheet" href="css/addons/datatables.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <!-- <link rel="stylesheet" href="css/styleA.css"> -->
    <style>
        body{
            background:#343a40;
            color:white;
        }


        .pp{
            border : 3px rgba(103, 58, 183, 0.7) solid;
        }

        .ps{
            border : 3px rgba(0, 150, 136, 0.7) solid;
        }

        /*  Removing arrows on spinner */
        /* For Firefox */

        input[type='number'] {
            -moz-appearance:textfield;
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
   <header class="bg-white">
        <nav class="navbar navbar-expand-md navbar-light ">
            <a class="navbar-brand" href="dashboard.jsp"><span><strong>हवासपुर महिला दुग्ध उत्पादक सहयोग समिति </strong></span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="dashboard.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="daily.jsp">Daily Register</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Address<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item  ">
                    <a class="nav-link " href="fregister1.jsp">Farmer Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="print1.jsp">Print</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="rate_chart.jsp">Rate Chart</a>
                    </li>
                </ul>
                <!-- Logout Button -->
                <form action="logout" class="form-inline mt-2 mt-md-0">
                    <button class="btn btn-deep-orange my-2 my-sm-0" type="submit">Logout</button>
                </form>
            </div>
        </nav>
    </header>

<div class="container-fluid">
    <div class="row  mt-3 ">
        <div class="col-md-3">
            <div class="text-center rounded badge rgba-blue-grey-strong d-block">
                <h1 ><strong id="add">Add Farmer</strong></h1>
            </div>

            <form id="edits" action="add" method="get" class=" rgba-blue-grey-strong py-3 px-3 rounded">
                <div class="form-group  my-4">
                    <div class="input-group my-4 ">
                        <div class="input-group-prepend">
                            <span class="input-group-text">ID</span>
                        </div>
                        <input type="number" id="fid" class="form-control " name="farmer_id" placeholder="Farmer ID" min="0"
                               required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Name</span>
                        </div>
                        <input type="text" class="form-control" name="farmer_name" placeholder="Farmer Name" required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">D/O , W/O</span>
                        </div>
                        <input type="text" class="form-control" name="parents_name" placeholder="Parents Name" required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Type</span>
                        </div>
                        <input type="text" class="form-control" name="type" placeholder="Milk Type" required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Address</span>
                        </div>
                        <input type="text" class="form-control" name="address" placeholder="Address" required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Mobile</span>
                        </div>
                        <input type="number" class="form-control" name="mobile" placeholder="Mobile Number" min="0"
                               required>
                    </div>
                </div>
                <div class="form-group my-4">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Account</span>
                        </div>
                        <input type="number" class="form-control" name="savings_account" placeholder="Account Number"
                               min="0" required>
                    </div>
                </div>
                <div class="form-group  my-4">
                    <button type="submit" id="ins" class="btn btn-block mb-2 btn-primary text-white">INSERT DATA</button>
                </div>
                <h6 class="text-danger mt-2 text-center" id="error"></h6>
            </form>
        </div>

        <!-- Show Data -->
        <div class="col-md-9">
                <div class="col  rounded">
                    <div class=" row  text-center rounded  badge rgba-teal-strong d-block ">
                        <h1><strong>Show Farmer</strong></h1>
                    </div>
                    <div class=" row  rounded  badge rgba-teal-strong d-block">
                        <table id='dtBasicExample' class='table bg-white text-dark table-striped table-bordered'>
                            <thead>
                            <tr>
                                <th class='th-sm'>ID
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Name
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Parents
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Address
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th>
                                <th class='th-sm'>Type
                                    <i class='fa fa-sort float-right' aria-hidden='true'></i>
                                </th><th class='th-sm'>Mobile
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th><th class='th-sm'>Account No.
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                                <th>Edit</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% while (resultSet.next()){%>
                            <tr id="<%=resultSet.getInt("farmer_id")%>">
                                <td style=font-size:1.1rem;><%=resultSet.getInt("farmer_id")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("farmer_name")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("parents_name")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("address")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("type")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("mobile")%></td>
                                <td style=font-size:1.1rem;><%=resultSet.getString("savings_account")%></td>
                                <td style="font-size:1.1rem;" class="text-center view overlay zoomIn">
                                    <a onclick="changeInfo(<%=resultSet.getInt("farmer_id")%>)">
                                        <i class="fa text-info fa-edit"></i>
                                        <div class="mask flex-center info-color">
                                            <i class="fa text-white fa-edit"></i>
                                        </div>
                                    </a>
                                </td>
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
<script type='text/javascript' src=js/customDataTable.js></script>

<%-- <script>
    $(document).ready(function() {
        $('#dtBasicExample').DataTable( {
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
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
    } );
</script> --%>

<script >
    function changeInfo(i) {
        $("#edits").attr('action', 'edit');
        $("#ins").html("Save");
        $("#add").html("Edit");
        var urls = "getcustomer.jsp?id=" + i;
        var Http = new XMLHttpRequest();
        Http.open("GET", urls);
        Http.send();
        Http.onreadystatechange = function () {
            my_JSON_object = JSON.parse(Http.responseText);
            if (my_JSON_object.name != null) {
                $("input[name='farmer_id']").val(my_JSON_object.id);
                $("#fid").prop('readonly', true);
                $("input[name='farmer_name']").val(my_JSON_object.name);
                $("input[name='parents_name']").val(my_JSON_object.parents_name);
                $("input[name='type']").val(my_JSON_object.type);
                $("input[name='address']").val(my_JSON_object.address);
                $("input[name='mobile']").val(my_JSON_object.mobile);
                $("input[name='savings_account']").val(my_JSON_object.savings);
            }
        }
    }

</script>

</body>

</html>