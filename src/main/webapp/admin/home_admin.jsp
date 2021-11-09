<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin: Home</title>
    <%@include file="allCss_for_admin.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<>
<%@include file="navbar_for_admin.jsp"%>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                            <h4>Add books</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="all_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-danger"></i><br>
                            <h4>All Books</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-open fa-3x text-warning"></i><br>
                            <h4>Orders</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                            <h4>Logout</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
            </div>
        </div>
<div style="margin-top: 262px">
<%@include file="footer_for_admin.jsp"%>
</div>
</body>
</html>
