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
    <h1> Дякую </h1>
    <h2> Ваше замовлення успішно прийняте </h2>
    <h5> Через 7 днів ваше замовлення буде доставлено по вашому адресу </h5>
    <a href="index.jsp" class="btn btn-primary mt-3"> Головна сторінка </a>
    <a href="order.jsp" class="btn btn-danger mt-3"> Деталі замовлення </a>
</div>
<div style="margin-top: 15.6rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>