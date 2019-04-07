<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Daily Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/fa5/css/all.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/mdb.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/addons/datatables.css" />
</head>

<%--java for login and displaying data--%>
<%
    float toatalAmount=0;
    float toatalQty=0;
    float avgFat=0;
    float avgSnf=0;
    int count=0;
    try {

        session = request.getSession(false);
        if (session.getAttribute("username").toString().equalsIgnoreCase("admin2")) {
            Connection con = DBServices.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT dr.*, fi.farmer_name FROM daily_register as dr, farmer_info as fi  where dr.farmer_id = fi.farmer_id and date=? and shift=? ORDER BY Serial_no DESC ");
            preparedStatement.setString(1,session.getAttribute("date").toString());
            preparedStatement.setString(2, session.getAttribute("shift").toString());
            ResultSet resultSet = preparedStatement.executeQuery();

%>


<body>
<!--Top Navigation Bar -->
<header>
    <nav class="navbar navbar-expand-md navbar-light ">
        <a class="navbar-brand" href="dailyScratch.html">MDSSU</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="dashboard.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Daily Register<span class="sr-only">(current)</span></a>
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

<!-- Main Page -->
<main>
    <div class="container-fluid">
        <!-- 1st row for:
            SNO, Name, Date, Shift ,total amount, average fat & average snf-->
        <form id="form" method="GET" action="insertData">
            <div class="row grey">
                <div class="col">
                    <div class="row d-none d-md-flex ">
                        <div class="col-sm text-center text-white">SNO</div>
                        <div class="col-sm text-center text-white">Name</div>
                        <div class="col-sm text-center text-white">Shift</div>
                        <div class="col-sm text-center text-white">Date</div>
                        <div class="col-sm-1 text-center text-white">Total Qty</div>
                        <div class="col-sm-1 text-center text-white">Tot Amount</div>
                        <div class="col-sm-1 text-center text-white">Avg FAT</div>
                        <div class="col-sm-1 text-center text-white">Avg SNF</div>
                    </div>
                    <div class="row">

                        <input name="serial_no" id="farmer_sno" type="text" class="col-sm my-1 mx-2 form-control text-center"
                               value='<%=session.getAttribute("sno")%>' placeholder="Serial No.">
                        <input name="farmer_name" id="farmer_name" type="text" class="col-sm my-1 mx-2 form-control text-center"
                               value="" placeholder="Name">
                        <select name="shift" id="farmer_shift"  class="col-sm my-1 mx-2 form-control text-center" onchange="loadDoc()">
                            <option id="opt1" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Morning")) out.print("selected");%> style="font-size:1.1rem">Morning</option>
                            <option id="opt2" <%if(session.getAttribute("shift").toString().equalsIgnoreCase("Evening")) out.print("selected");%> style="font-size:1.1rem">Evening</option>
                        </select>
                        <input name="daily_date" id="daily_date"  type="date" class="col-sm my-1 mx-2 form-control text-center"  value="<%=session.getAttribute("date")%>" onchange="loadDoc();" >
                        <input name="" id="daily_qty" type="text" class="col-sm-1 my-1  form-control text-center"
                               value="" placeholder="Total Milk">
                        <input name="" id="daily_amount" type="text" class="col-sm-1 my-1  form-control text-center"
                               value="" placeholder="Total Amount">
                        <input name="" id="daily_fat" type="text" class="col-sm-1 my-1  form-control text-center"
                               value="" placeholder="Avg. Fat">
                        <input name="" id="daily_snf" type="text" class="col-sm-1 my-1  form-control text-center"
                               value="" placeholder="Avf. Snf">
                        <input type="text" name="Q" id="q" class="form-control d-none" value="i">
                        <input type="text" name="D" id="d" class="form-control d-none" value="0">

                    </div>
                </div>

            </div>


            <!-- 2nd Row for taking input: 
                ID, Qty, Fat, Snf, Milk Rate and Milk Amount
                name="farmer_id"
                name="qty"
                name="fat"
                name="snf"
                name="MilkRate"
                name="DailyAmount"
            -->
            <div class="row grey">
                <div class="col">
                    <div class="row d-none d-md-flex ">
                        <div class="col-sm text-center text-white">ID</div>
                        <div class="col-sm text-center text-white">Qty</div>
                        <div class="col-sm text-center text-white">Fat</div>
                        <div class="col-sm text-center text-white">Snf</div>
                        <div class="col-sm text-center text-white">Milk Rate</div>
                        <div class="col-sm text-center text-white">Milk Amount</div>
                        <div class="col-sm text-center text-white">Submit</div>
                    </div>
                    <div class="row" class="">
                        <input name="farmer_id" id="farmer_id" type="text"
                               class="col-sm my-1 mx-2 form-control text-center" value="" placeholder="Enter ID"
                               required>
                        <input name="qty" id="farmer_qty" type="text" class="col-sm my-1 mx-2 form-control text-center"
                               value="" placeholder="Enter Qty." required>
                        <input name="fat" id="farmer_fat" type="text" class="col-sm my-1 mx-2 form-control text-center"
                               value="" placeholder="Enter Fat" required>
                        <input name="snf" id="farmer_snf" type="text" class="col-sm my-1 mx-2 form-control text-center"
                               value="" placeholder="Enter Snf" required>
                        <input name="MilkRate" id="farmer_rate" type="text"
                               class="col-sm my-1 mx-2 form-control text-center" value="" placeholder="Milk Rate"
                               required>
                        <input name="DailyAmount" id="farmer_amount" type="text"
                               class="last col-sm my-1 mx-2 form-control text-center" value="" placeholder="Milk Amount"
                               required>
                        <button id="daily_submit" type="submit" class="col-sm  btn form-control btn-deep-orange">
                            Submit
                        </button>
                    </div>
                </div>

            </div>
        </form>

        <!-- 3rd row for displayinf daily register -->
        <div class="row">
            <div class="col-12">
                <table id='dtBasicExample' class='table bg-white text-dark table-striped table-bordered'>
                    <thead>
                    <tr>
                        <th class='th-sm'>SNO
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>ID
                            <i class='fa fa-sort float-right' aria-hidden='true'></i>
                        </th>
                        <th class='th-sm'>Name
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

                    <% while (resultSet.next()) {
                        toatalAmount+=Float.parseFloat(resultSet.getString("DailyAmount"));
                        toatalQty+=Float.parseFloat(resultSet.getString("qty"));
                        avgFat=(avgFat+Float.parseFloat(resultSet.getString("fat")));
                        avgSnf=(avgSnf+Float.parseFloat(resultSet.getString("snf")));
                        count++;
                        %>
                    <tr id="edit-<%=resultSet.getInt("farmer_id")%>">
                        <td style=font-size:1.1rem;><%=resultSet.getInt("Serial_no")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getInt("farmer_id")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getString("farmer_name")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getString("shift")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("qty")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("fat")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("snf")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getFloat("MilkRate")%>
                        </td>
                        <td style=font-size:1.1rem;><%=resultSet.getString("DailyAmount")%>
                        </td>
                        <td style="font-size:1.1rem;" class="text-center view overlay zoomIn">
                            <a onclick="changeInfo(<%=resultSet.getInt("farmer_id")%>)">
                                <i class="fa text-info fa-edit"></i>
                                <div class="mask flex-center info-color">
                                    <i class="fa text-white fa-edit"><%=count%></i>
                                </div>
                            </a>
                        </td>
                        <td class="d-none" style=font-size:1.1rem;><%=resultSet.getInt("daily_Id")%>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <%
                        }else {
                            response.sendRedirect("index.jsp");
                        }
                    } catch (Exception e) {
                            System.out.println(e.getMessage());
                            response.sendRedirect("index.jsp");
                    }
               %>
                </div>
            </div>
        </div>
    </main>

    <script type='text/javascript' src='js/jquery.min.js'></script>
    <script type='text/javascript' src='js/popper.min.js'></script>
    <script type='text/javascript' src='js/bootstrap.min.js'></script>
    <script type='text/javascript' src='js/mdb.min.js'></script>
    <script type='text/javascript' src='js/addons/datatables.js'></script>
    <!-- <script type='text/javascript' src='js/addons/buttons.flash.min.js'></script> -->
    <script type='text/javascript' src='js/addons/buttons.html5.min.js'></script>
    <script type='text/javascript' src='js/addons/buttons.print.min.js'></script>
    <script type='text/javascript' src='js/addons/dataTables.buttons.min.js'></script>
    <script type='text/javascript' src='js/addons/jszip.min.js'></script>
    <script type='text/javascript' src='js/addons/pdfmake.min.js'></script>
    <script type='text/javascript' src='js/addons/vfs_fonts.js'></script>
    <script src="js/enter.js"></script>
    <script src="js/customDataTable.js"></script>
    <script src="js/dailyEntry.js"></script>
    <script src="js/shiftDate.js"></script>
    <script src="js/getRate.js"></script>
    <script src="js/dailyUpdate.js"></script>
    <script>
        var totalAMount= parseFloat(<%=toatalAmount%>).toFixed(2);//(Math.floor(()*100))/100;
        var totalQTY= parseFloat(<%=toatalQty%>).toFixed(2);//(Math.floor(()*100))/100;
        var avgFAT= parseFloat(<%=avgFat/count%>).toFixed(2);//(Math.floor(()*100))/100;
        var avgSNF= parseFloat(<%=avgSnf/count%>).toFixed(2);//(Math.floor(()*100))/100;
        $("#daily_fat").val(avgFAT);
        $("#daily_snf").val(avgSNF);
        $("#daily_amount").val(totalAMount);
        $("#daily_qty").val(totalQTY);
    </script>
    
</body>
</html>