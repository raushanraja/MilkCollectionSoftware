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
                    <li class="nav-item active">
                        <a class="nav-link" href="dashboard.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="daily.jsp">Daily Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="address.jsp">Address</a>
                    </li>
                      <li class="nav-item">
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
    <div class="container-fluid grey darken-3" style="min-height:90vh">

        <div class="row justify-content-between ">
            <div class="col-sm-2 bg-dark ">
                <div class="row  cs">
                    <div class="col align-self-end">
                        <img src="images/logo.png" alt="comfed_logo" class="d-block m-auto py-3 pl-2 pr-4 bg-info">
                    </div>

                </div>
                <!-- <div class="card rounded-0 text-center">
                          <div class="card-body">
                            <h4 class="card-title">SideBar1</h4>
                            <p class="card-text">Side</p>
                          </div>
                        </div> -->
            </div>
            <div class="col-sm-9">
                <div class="container cs row m-auto">
                    <div class="col-sm-3 mt-5 align-self-center">
                        <div class="card blue-grey">
                            <a href="address.jsp">
                                <img src="images/my-icons/png/035-phone-book.png" alt="" class="p-4 bg-white card-img-top">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 class="text-white text-center"><strong>Address Book</strong></h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-3 mt-5  align-self-center">
                        <div class="card blue-grey">
                            <a href="daily.jsp">
                                <img src="images/my-icons/png/038-research.png" alt="" class="p-4 bg-white card-img-top">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 class="text-white text-center"><strong>Daily Register</strong></h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                   
                    <div class="col-sm-3 mt-5  align-self-center">
                        <div class="card blue-grey">
                            <a href="fregister1.jsp">
                                <img src="images/my-icons/png/012-clipboard.png" alt="" class="p-4 bg-white card-img-top">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 class="text-white text-center"><strong>Farmer Register</strong></h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-3 mt-5  align-self-center">
                        <div class="card blue-grey">
                            <a href="rate_chart.jsp">
                                <img src="images/my-icons/png/030-technical-support.png" alt="" class="p-4 bg-white card-img-top">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 class="text-white text-center"><strong>Rate Chart</strong></h4>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-3 mt-5  align-self-center">
                        <div class="card blue-grey">
                            <a href="print1.jsp">
                                <img src="images/my-icons/png/030-technical-support.png" alt="" class="p-4 bg-white card-img-top">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h4 class="text-white text-center"><strong><i class="fas fa-print "></i> Print</strong></h4>
                                    </div>
                                </div>
                            </a>
                        </div>
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