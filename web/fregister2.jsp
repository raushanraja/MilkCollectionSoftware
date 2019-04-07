<%@ page import="in.hexweb.DBServices" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%
        try{
            session = request.getSession(false);
            if (session != null) {
                String username = session.getAttribute("username").toString();
                String type = session.getAttribute("type").toString();
                PrintWriter p = new PrintWriter(out);

    %>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Milk Collection Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/fa5/css/all.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/mdb.css" />
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="css/styleA.css" /> -->
    <link rel="stylesheet" type="text/css" media="screen" href="css/addons/datatables.css" />
    <link rel="stylesheet" href="css/custom.css">

    <script src="main.js"></script>
    <style>
        body {
            min-height: 100vh;
        }

        .sidebar,
        .cs {
            min-height: 90vh;
        }

    </style>

</head>

<body class="blue lighten-1">
<%if (type.equalsIgnoreCase("admin")) { %>
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
                <li class="nav-item ">
                    <a class="nav-link" href="#">Daily Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="address.jsp">Address</a>
                </li>
                  <li class="nav-item  active">
                    <a class="nav-link " href="fregister1.jsp">Farmer Register<span class="sr-only">(current)</span></a>
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
<div class="container-fluid grey darken-3" style="min-height:90vh">

    <div class="row justify-content-between ">
           <div class="col-sm-2 bg-dark " >
         <div class="row" style="min-height:80vh">
            <div class="col">
                 <form action="fregister2.jsp">
                    <div class="card mt-5 mx-auto">
                        <div class="card-header text-center"><strong>Select ID and Date</strong></div>
                        <div class="card-body">
                            <label><strong>Enter farmer ID</strong></label>
                            <input name="farmer_id" id="farmer_id" type="Number" class="form-control " min="1" value="" placeholder="ID" required >

                            <label class="mt-3"><strong>From</strong></label>

                            <input name="date1" id="date1" type="Date" class="form-control "  value="<%=session.getAttribute("date")%>" placeholder="From" required>
                            <label class="mt-3"><strong>TO</strong></label>
                            <input name="date2" id="date2" type="Date" class="form-control " value="<%=session.getAttribute("date")%>" placeholder="From" required>
                            <button  id="bottunSumit" class=" mt-2 btn btn-block btn-primary">Show</button>

                        </div>
                    </div>
                 </form>

            </div>
         </div>
         <div class="row">
             <div class="col ">
                 <img src="images/logo.png" alt="comfed_logo" class="d-block m-auto py-3 pl-2 pr-4 bg-info">
             </div>
         </div>
        </div>
        <%
            Connection con = DBServices.getConnection();
            int id=Integer.parseInt(request.getParameter("farmer_id"));
            String date1=request.getParameter("date1");
            String date2=request.getParameter("date2");
            float totalAmount=0;
            float totalMilk=0;
           %>
        <div class="col-sm-10">
           <div class="row">
                <div class="col bg-white">
                    <lable class="float-right p-1">Total Amount:<input id="amounts" type="text" disabled></lable>
                    <lable class="float-right p-1">Total Milk:<input id="milks" type="text" disabled></lable>
                </div>
           </div>
           <div class="row">
            <div class="col">
                 <table id='dtBasicExample' class='table bg-white text-dark table-striped table-bordered'>
               <thead>
                    <tr>
                        <th class='th-sm'>Date
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>Shift
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>Qty
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>FAT
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>SNF
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>Rate
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>Amount
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                    </tr>
                </thead>
                <tbody>
                <% try {
                    PreparedStatement preparedStatement  = con.prepareStatement("select farmer_id,shift,qty,fat,snf,DailyAmount, MilkRate,Date from daily_register where farmer_id=? and Date>=? and Date<=?");
                    preparedStatement.setInt(1,id);
                    preparedStatement.setString(2,date1);
                    preparedStatement.setString(3,date2);
                    ResultSet resultSet=preparedStatement.executeQuery();
                    while (resultSet.next()){
                        totalAmount+=resultSet.getFloat("DailyAmount");
                        totalMilk+=resultSet.getFloat("qty");

                %>
                <tr>

                        <td style=font-size:1.1rem;><%=resultSet.getString("Date")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getString("shift")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("qty")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("fat")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("snf")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("MilkRate")%></td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("DailyAmount")%></td>
                        
                    
                    
                </tr>
                <%
                        }
                    } catch (Exception e) {
                                System.out.println("Error inn callable");
                                System.out.println(e.getMessage());
                    }%>
                </tbody>
            </table>


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
<script type='text/javascript' src=js/addons/pdfmake.min.js></script>
<script type='text/javascript' src=js/addons/vfs_fonts.js></script>
<script type='text/javascript' src=js/addons/jszip.min.js></script>
<script>

    $(document).ready(function() {

        $("#amounts").val(<%=totalAmount%>);
        $("#milks").val(<%=totalMilk%>);
        // Focues on farmerID Input filed
        $('#dtBasicExample').DataTable({
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>" +
                "<'row'<'col-sm-12'B>>",
            buttons: [

                {extend: 'copy', className: 'btn btn-primary glyphicon glyphicon-duplicate'},
                {extend: 'csv', className: 'btn btn-primary glyphicon glyphicon-save-file'},
                {extend: 'excel', className: 'btn btn-primary glyphicon glyphicon-list-alt'},
                {
                    extend: 'pdf', className: 'btn btn-primary glyphicon glyphicon-file',
                    exportOptions: {
                        columns: ':visible'
                    },
                    customize: function (doc) {
                        doc.content[1].table.widths =
                            Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                    }
                },
                {
                    extend: 'print', className: 'btn btn-primary glyphicon glyphicon-print',
                }
            ]
        })
    });

</script>
</body>
</html>
<%}}else {
    out.println(" <script>\n" +
            " var msg='Please Login to access" +
            "'" +
            " </script>");
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("index.jsp");
    rd.include(request, response);
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