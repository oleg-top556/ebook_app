<%@ page import="com.ebook.DAO.BookOrderImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookOrder" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Адмін: Замовлення</title>
    <%@include file="allCss_for_admin.jsp"%>
</head>
<body style="background-color: #e6e8eb">
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>
<%@include file="navbar_for_admin.jsp"%>


<h3 class="text-center"> Hello Admin </h3>
<c:if test="${not empty successMsg}">
    <p class="text-center text-success"> ${successMsg}</p>
    <c:remove var="successMsg" scope="session" />
</c:if>

<c:if test="${not empty failedMsg}">
    <p class="text-center text-danger"> ${failedMsg}</p>
    <c:remove var="failedMsg" scope="session" />
</c:if>
<table class="table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Замовлення номер</th>
        <th scope="col">Ім'я</th>
        <th scope="col">Пошта</th>
        <th scope="col">Адреса</th>
        <th scope="col">Телефон</th>
        <th scope="col">Назва книги</th>
        <th scope="col">Автор</th>
        <th scope="col">Ціна</th>
        <th scope="col">Вибрати тип оплати</th>
    </tr>
    </thead>
    <tbody>

    <%
        BookOrderImpl dao = new BookOrderImpl(DataBaseConnection.getConnection());
        List<BookOrder> bookOrderList = dao.getAllOrder();
        for (BookOrder b: bookOrderList)
        {%>
    <tr>
        <th scope="row"><%=b.getOrder()%></th>
        <td><%=b.getUser_name()%></td>
        <td><%=b.getEmail()%></td>
        <td><%=b.getFullAdd()%></td>
        <td><%=b.getPhone()%></td>
        <td><%=b.getBookName()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getPaymentType()%></td>
    </tr>
    <%
        }
    %>



    </tbody>
</table>
</body>
</html>
