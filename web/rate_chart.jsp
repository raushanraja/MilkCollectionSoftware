<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: raushan
  Date: 23/10/18
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Milk Collection Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="css/fa5/css/all.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="css/mdb.css"/>
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="css/styleA.css" /> -->
    <link rel="stylesheet" type="text/css" media="screen" href="css/addons/datatables.css"/>
    <link rel="stylesheet" href="css/custom.css">
    <style>
        body {
            min-height: 100vh;
        }

        .sidebar,
        .cs {
            min-height: 90vh;
        }
        <%
        try{
            if(session.getAttribute("type").toString().equalsIgnoreCase("admin")){
                Connection con = DBServices.getConnection();
                PreparedStatement preparedStatement;
                try{
                    preparedStatement=con.prepareStatement("select rate_id,Fat,Snf,MilkRate from rate_chart;");
                    ResultSet resultSet = preparedStatement.executeQuery();
                   %>

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
                        <a class="nav-link" href="daily.jsp">Daily Register<span class="sr-only">(current)</span></a>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="address.jsp">Address</a>
                    </li>
                      <li class="nav-item  ">
                    <a class="nav-link " href="fregister1.jsp">Farmer Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="print1.jsp">Print</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link " href="#">Rate Chart <span class="sr-only">(current)</span></a>
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
    <div class="row justify-content-center mt-5">
        <div class="col-md-9">
            <div class="col  rounded">
                <div class=" row  text-center rounded  badge rgba-teal-strong d-block ">
                    <h1><strong>Rate Chart</strong></h1>
                </div>
                <div class=" row  rounded  badge rgba-teal-strong d-block">
                    <table id='dtBasicExample' class='table bg-white text-dark table-striped table-bordered'>
                        <thead>
                        <tr>
                            <th class='th-sm'>S.no
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                            <th class='th-sm'>Fat%
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                            <th class='th-sm'>SNF%
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                            <th class='th-sm'>Rate / kg
                                <i class='fa fa-sort float-right' aria-hidden='true'></i>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%while (resultSet.next()) {%>
                        <tr>
                            <td style=font-size:1.1rem;><%=resultSet.getInt("rate_id")%>
                            </td>
                            <td style=font-size:1.1rem;><%=resultSet.getFloat("Fat")%>
                            </td>
                            <td style=font-size:1.1rem;><%=resultSet.getFloat("Snf")%>
                            </td>
                            <td style=font-size:1.1rem;><%=resultSet.getFloat("MilkRate")%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <%
                            } catch (Exception e) {
                                out.print(e.getMessage());
                            }
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    } catch (Exception e) {
            response.sendRedirect("index.jsp");
                    }%>
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
</script>
</body>
</html>
