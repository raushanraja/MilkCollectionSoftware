<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %><%--
  Created by IntelliJ IDEA.
  User: raushan
  Date: 16/10/18
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Login</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">


    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/fa5/css/all.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/mdb.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");

    %>
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
                </ul>
                <!-- Logout Button -->
            </div>
        </nav>
    </header>
<main>
    <div class="container">

        <div class="row  justify-content-center"  style="min-height:800px">
            <div class="col-sm-6  rounded align-self-center" >
                <h4 class="text-center text-dark my-3">Authentication Gateway</h4>
                <div class="card mt-5 mx-5"  style="min-height:600px">
                    <div class="card-header bg-primary">
                        <div class="bg-primary img-top">
                            <img src="images/login-icon.png" class="rounded mx-auto d-block selectDisable" style="height: 80px;
                                                    width: 80px;">
                        </div>
                    </div>
                    <div class="card-body stylish-color-dark">
                        <div class="catd-title text-white text-center pt-5"><h3>Sign in for access</h3></div>
                        <form action="login" method="POST" class="px-4 py-3 rounded">
                            <div class="form-group  my-4">
                                <div class="input-group my-4 ">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="text-primary fa fa-user-circle"></i></span>
                                    </div>
                                    <input type="text" class="form-control" name="username" placeholder=username required>
                                </div>
                            </div>
                            <div class="form-group my-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="text-primary fa fa-key"></i></span>
                                    </div>
                                    <input type="text" class="form-control" name="password" placeholder="password" required>
                                </div>
                            </div>
                            <div class="form-group  my-4">
                                <button type="submit" class="btn btn-block  mb-2 btn-outline-primary">Login</button>
                            </div>
                            <h6 class="text-danger mt-2 text-center" id="error"></h6>
                        </form>

                    </div>
                    <div class="card-footer stylish-color" style="opacity:.9;">
                        <h6><a href="" class="text-white">Click here to reset password</a></h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <p class="text-center text-white"><i class="fa fa-copyright"> <a href="http://hexweb.in" class="text-white">hexweb</a> 2018-2019 </i></p>
</footer>
<script>



</script>
</body>
</html>
