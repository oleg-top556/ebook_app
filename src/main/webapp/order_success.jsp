<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank you</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container text-center mt-3">
    <i class="fas fa-check-circle fa-5x text-success"></i>
    <h1> Thank You </h1>
    <h2> Your Order successfully </h2>
    <h5> With in 7 Days your product will be delivered to your Address</h5>
    <a href="index.jsp" class="btn btn-primary mt-3"> Home </a>
    <a href="user_order.jsp" class="btn btn-danger mt-3"> View Order </a>
</div>
<div style="margin-top: 15.6rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>