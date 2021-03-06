<%-- 
    Document   : index
    Created on : 12-Nov-2016, 18:14:11
    Author     : ndine
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>APPointmentZ Registration</title>

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
        <!--<script src="assets/js/jquery.min.js"></script>-->
        <script src="js/jquery.min.js"></script>

    </head>

    <body>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>APPointmentZ</strong> Register Form <% if(request.getParameter("register")!=null){ out.println("<p style='color:red'>"+request.getParameter("register")+"</p>");} %></h1>
                            <div class="description">
                            	<p>
	                            	Why wait in queues. Do something you like. We will notify you. <a href=""><strong>APPointmentZ.lk</strong></a>, Join with us
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Register to our site</h3>
                                                <p>Register your hospital in the following form.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="./reg" method="post" class="login-form">
                                                <div class="form-group">
                                                    <p>Enter your Hospital Id:</p><p style="color: red;" id="id"></p>
			                    		<label class="sr-only" for="form-username">Hospital Id</label>
                                                        <input required type="text"  name="form-id" placeholder="Hospital Id..." class="form-username form-control" id="form-id">
			                        </div>
			                    	<div class="form-group">
                                                    <p>Enter your Hospital UserName:</p><p style="color: red;" id="hos_id"></p>
			                    		<label class="sr-only" for="form-username">Hospital Id</label>
                                                        <input required type="text"  name="form-hospital-id" placeholder="Hospital Username..." class="form-username form-control" id="form-hospital-id">
			                        </div>
			                        <div class="form-group">
                                                        <p>Enter password:</p>
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input required type="password"  name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
                                                <div class="form-group">
                                                        <p>Re-Enter password:</p>
			                        	<label class="sr-only" for="form-re-password">Re-Password</label>
			                        	<input required type="password"  name="form-re-password" placeholder="Re-Password..." class="form-password form-control" id="form-re-password">
			                        </div>
                                                <div class="form-group">
                                                        <p>Enter your Hospital Name:</p>
			                    		<label class="sr-only" for="form-hospital-name">Hospital Name</label>
                                                        <input required type="text" onchange="" name="form-hospital-name" placeholder="Hospital Name..." class="form-username form-control" id="form-hospital-name">
			                        </div>
                                                <button type="submit" id="myBtn" style="display:inline; width:62%; margin-right:2%" class="btn">Register!</button>
                                                <button type="button" class="btn" style="display:inline; width:35%;" onClick="window.location.assign('index.jsp')">Back</button>
                                                <script>
                                                    var check = 0;
                                                    var check1 = 0;
                                                    $(document).ready(function checkHospitalId(){
                                                        $("#form-hospital-id").change(function(){
                                                            $.get("checkHospitalId.jsp?sel=0&hospital_id="+$("#form-hospital-id").val(), function(data, status,response){
                                                                state = response.getResponseHeader("STATE");
                                                                if(state === "Unavailable"){
                                                                    $("#hos_id").text("");
                                                                    $("#form-hospital-id").css("background-color", "white");
                                                                    if($("#form-re-password").val()=== $("#form-password").val() && $("#form-re-password").val()!=="" && $("#form-id").val()!=="" && $("#form-password").val()!==""){
                                                                        $("#form-re-password,#form-password").css("color","black");
                                                                        if(check1 ===0){
                                                                            $(':input[type="submit"]').prop('disabled', false);
                                                                        }
                                                                        else{
                                                                            $(':input[type="submit"]').prop('disabled', true);
                                                                        }
                                                                    }else{
                                                                        $("#form-re-password,#form-password").css("color","red");
                                                                        $(':input[type="submit"]').prop('disabled', true);
                                                                    }
                                                                    check = 0;
                                                                    
                                                                }
                                                                else if(state === "Available"){
                                                                    $("#hos_id").text("This User Name Already Available!");
                                                                    $("#form-hospital-id").focus()
                                                                    $("#form-hospital-id").css("background-color", "#ea8596");
                                                                    $(':input[type="submit"]').prop('disabled', true);
                                                                    check = 1;
                                                                }
                                                                else{
                                                                    $("#hos_id").text("Error occured!");
                                                                    $(':input[type="submit"]').prop('disabled', true);
                                                                    check = 1;
                                                               }
                                                               
                                                                });
                                                        });
                                                    });
                                                    $(document).ready(function checkId(){
                                                        $("#form-id").change(function(){
                                                            $.get("checkHospitalId.jsp?sel=1&id="+$("#form-id").val(), function(data, status,response){
                                                                state = response.getResponseHeader("STATE");
                                                                if(state === "Unavailable"){
                                                                    $("#id").text("");
                                                                    $("#form-id").css("background-color", "white");
                                                                    if($("#form-re-password").val()=== $("#form-password").val() && $("#form-re-password").val()!=="" && $("#form-hospital-id").val()!=="" && $("#form-password").val()!==""){
                                                                        $("#form-re-password,#form-password").css("color","black");
                                                                        if(check === 0){
                                                                            $(':input[type="submit"]').prop('disabled', false);
                                                                        }
                                                                        else{
                                                                            $(':input[type="submit"]').prop('disabled', true);
                                                                        }
                                                                    }else{
                                                                        $("#form-re-password,#form-password").css("color","red");
                                                                        $(':input[type="submit"]').prop('disabled', true);
                                                                    }
                                                                    check1 = 0;
                                                                    
                                                                }
                                                                else if(state === "Available"){
                                                                    $("#id").text("This Hospital Id Already Available!");
                                                                    $("#form-id").focus()
                                                                    $("#form-id").css("background-color", "#ea8596");
                                                                    $(':input[type="submit"]').prop('disabled', true);
                                                                    check1 = 1;
                                                                }
                                                                else{
                                                                    $("#id").text("Error occured!");
                                                                    $(':input[type="submit"]').prop('disabled', true);
                                                                    check1 = 1;
                                                               }
                                                               
                                                                });
                                                        });
                                                    });
                                                    $(document).ready(function checkPassword(){
                                                        $("#form-re-password,#form-password").keyup(function(){
                                                           
                                                           if($("#form-re-password").val()=== $("#form-password").val() && $("#form-re-password").val()!=="" && $("#form-password").val()!==""){
                                                               $("#form-re-password,#form-password").css("color","black");
                                                               if(check === 0 && check1 === 0){
                                                                    $(':input[type="submit"]').prop('disabled', false);
                                                                }else{
                                                                    $(':input[type="submit"]').prop('disabled', true);
                                                                }
                                                           }else{
                                                               $("#form-re-password,#form-password").css("color","red");
                                                               $(':input[type="submit"]').prop('disabled', true);
                                                           }
                                                           
                                                        });
                                                    });    
                                                    
                                                </script>
                                                <script>
                                                    
                                               /*     function check(){
                                                        if(!(document.getElementById("form-re-password").value === document.getElementById("form-password").value)){
                                                            document.getElementById("form-re-password").style.color = "red";
                                                            document.getElementById("form-password").style.color = "red";
                                                            disableBtn();
                                                            return false ;
                                                        }else{
                                                            document.getElementById("form-re-password").style.color = "black";
                                                            document.getElementById("form-password").style.color = "black";
                                                        }
                                                        if(checkHospitalId()==0)
                                                        {
                                                            disableBtn();
                                                            
                                                            return false;
                                                        }
                                                        undisableBtn();
                                                        return true;
                                                    }
                                                    function checkPassword(){
                                                        if(!(document.getElementById("form-re-password").value === document.getElementById("form-password").value)){
                                                            document.getElementById("form-re-password").style.color = "red";
                                                            document.getElementById("form-password").style.color = "red";
                                                            disableBtn();
                                                            return;
                                                        }else{
                                                            document.getElementById("form-re-password").style.color = "black";
                                                            document.getElementById("form-password").style.color = "black";
                                                            check();
                                                            return;
                                                        }
                                                    }
                                                    function checkHospitalId() {
                                                        var xhttp = new XMLHttpRequest();
                                                        xhttp.onreadystatechange = function() {
                                                          if (this.readyState == 4 && this.status == 200) {
                                                            if(this.getResponseHeader("STATE") === "Unavailable"){
                                                                document.getElementById("hos_id").innerHTML = "";
                                                                return 1;
                                                            }
                                                            document.getElementById("hos_id").innerHTML = "This Hospital Id Already Available!";
                                                            disableBtn();
                                                            return 0;
                                                          }
                                                        };
                                                        xhttp.open("GET", "checkHospitalId.jsp?hospital_id="+document.getElementById("form-hospital-id").value, true);
                                                        xhttp.send();
                                                    }
                                                    function undisableBtn() {
                                                        document.getElementById("myBtn").disabled = false;
                                                    }
                                                    function disableBtn() {
                                                        document.getElementById("myBtn").disabled = true;
                                                    }*/
                                                </script>
			                    </form>
		                </div>
                             
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<!--
                                <h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                                -->
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
        
        <!--Jquery-->
        
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
