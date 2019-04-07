<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
                        <a class="nav-link" href="dashboard.jsp">Home </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="daily.jsp">Daily Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="address.jsp">Address</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="fregister1.jsp">Farmer Register</a>
                    </li>
                    
                    <li class="nav-item  active">
                        <a class="nav-link " href="#">Print<span class="sr-only">(current)</span></a>
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
        <div class="col-sm-2 bg-dark ">
            <div class="row  cs">
                <div class="col align-self-end">
                    <img src="images/logo.png" alt="comfed_logo" class="d-block m-auto py-3 pl-2 pr-4 bg-info">
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="row mt-2 justify-content-center" style="min-height: 500px">
                <div class="col-5  d-block m-auto">
                    <form action="print2.jsp">
                        <div class="card">
                            <div class="card-header text-center"><strong>Select Dates</strong></div>
                            <div class="card-body">
                                <label><strong>Total number of Farmers</strong></label>
                                <input name="number" id="number" type="Number" class="form-control " min="1" value="<%=session.getAttribute("date")%>" placeholder="Total Farmer" required >

                                <label><strong>From</strong></label>
                                <input name="date1" id="date1" type="Date" class="form-control "  value="<%=session.getAttribute("date")%>" placeholder="From" required>
                               <label><strong>TO</strong></label>
                                <input name="date2" id="date2" type="Date" class="form-control " value="<%=session.getAttribute("date")%>" placeholder="From" required>
                                <button type="submit" class="btn btn-primary">Print</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
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