<%-- 
    Document   : checkHospitalId
    Created on : 19-Mar-2017, 16:55:30
    Author     : ndine
--%>
<%@ page session="true" %>
<%@page import="com.intelligentz.appointmentz.controllers.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
    </head>
    <body>
        <%
           if(request.getParameter("sel").equals("0")) {
                response.addHeader("STATE", Data.checkHospitalId((String)request.getParameter("hospital_id"),0));
           }
           else if(request.getParameter("sel").equals("1")) {
                response.addHeader("STATE", Data.checkHospitalId((String)request.getParameter("id"),1));
           }
        %>
    </body>
</html>
