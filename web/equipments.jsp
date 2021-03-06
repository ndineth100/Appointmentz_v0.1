<%@ page session="true" %>
<%@page import="com.intelligentz.appointmentz.controllers.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%
    
    if(session.getAttribute("hospital_id")==null || session.getAttribute("hospital_name")==null){
        response.sendRedirect("./index.jsp?auth=failed");
    }
    
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APPointmentZ</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
            <div style="position:absolute; right:30px; top:20px;">
                <button class="btn btn-primary dropdown-toggle" data-target="#demo" data-toggle="collapse" style='color:white'><% out.println(session.getAttribute("hospital_name")); %>
                        </button>
                        <button class="btn btn-primary" style='color:white' onClick="window.location.assign('home.jsp')">Home
                </button>
                <div id="demo" class="collapse">
                <form action="./logout" method="post">
                        <input class="btn btn-primary" style="color:red" type="submit" value="Logout" />
                    </form>
                </div>
            </div>
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>APPointmentZ</strong></h1>
                            <div class="description">
                            	<!--<p>
	                            	Why wait in queues. Do something you like. We will notify you. <a href=""><strong>APPointmentZ.lk</strong></a>, Join with us
                            	</p>-->
                                <p>Info about equipment</p>
                            </div>
                            <div class="description">
                            	
	                        <% if(request.getParameter("status")!=null){ out.println("<p style='color:green; background-color:white; font-size:18px;'><strong>"+request.getParameter("status")+"</strong></p>");} %>
                            	
                            </div>
                                
                        </div>
                    </div>
                    <div class="row" style="color:white">
					<center>
                                            <p><strong>Rooms</strong></p>
                        <table class="table table-bordered table-inverse">
								<tr>
                                                                        <th>Room Number</th>
                                                                        <th>Room Id</th>
									<th></th>
								</tr>
                                                                <%
                                                                String temp = Data.equipmentsGetRooms((String)session.getAttribute("hospital_id"));
                                                                if(temp == "Error"){
                                                                    response.setHeader("Location", "error.jsp?error=MYSQL connection failed!"); 
                                                                }
                                                                else{
                                                                    out.println(temp);
                                                                }
                                                                %>
								
							
						</table>
					</center>
                    </div>
                                                                
                                                                <div class="row" style="color:white">
					<center>
                                <p><strong>Device</strong></p>
                        <table class="table table-bordered table-inverse">
								<tr>
									<th>Auth</th>
									<th>Serial</th>
									<th>Room Number</th>
                                                                        <th>Room Id</th>
									<th></th>
                                                                        <th></th>
								</tr>
                                                                <%
                                                                    String temp1 = Data.equipmentsGetRPI((String)session.getAttribute("hospital_id"));
                                                                    if(temp1 == "Error"){
                                                                        response.setHeader("Location", "error.jsp?error=MYSQL connection failed!"); 
                                                                    }
                                                                    else{
                                                                        out.println(temp1);
                                                                    }
                                                                %>
								
							
						</table>
					</center>
                    </div>
                    <div><button type="button" class="btn" style="display:inline; position:absolute; right:10%; width:10%;" onClick="window.location.assign('home.jsp')">Back</button></div>                                            
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>Get notified before your appointment</h3>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>

