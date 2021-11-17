<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Адмін: Всі книги </title>
    <%@include file="allCss_for_admin.jsp"%>
</head>
<body style="background-color: #e6e8eb">
<%@include file="navbar_for_admin.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>
<h3 class="text-center"> Привіт,адмін </h3>

<c:if test="${not empty successMsg}">
    <h5 class="text-center text-success"> ${successMsg}</h5>
    <c:remove var="successMsg" scope="session" />
</c:if>

<c:if test="${not empty failedMsg}">
    <h5 class="text-center text-danger"> ${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session" />
</c:if>

<table class="table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Номер</th>
        <th scope="col">Малюнок</th>
        <th scope="col">Назва книги</th>
        <th scope="col">Автор</th>
        <th scope="col">Ціна</th>
        <th scope="col">Категорії</th>
        <th scope="col">Статус</th>
        <th scope="col">Дії</th>
    </tr>
    </thead>
    <tbody>
    <% BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
        List<BookDtls> list = dao.getAllBooks();
        for (BookDtls bookDtls: list){
        %>
    <tr>
        <td><%= bookDtls.getBook_id()%></td>
        <td><img src="../book/<%=bookDtls.getPhotoName()%>"
                 style="width:50px; height: 50px;"></td>
        <td><%= bookDtls.getBook_name()%></td>
        <td><%= bookDtls.getAuthor()%></td>
        <td><%= bookDtls.getPrice()%></td>
        <td><%= bookDtls.getBook_category()%></td>
        <td><%= bookDtls.getStatus()%></td>
        <td>
            <a href="edit_books.jsp?id=<%=bookDtls.getBook_id()%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Виправити книги </a>
            <a href="../delete?id=<%=bookDtls.getBook_id()%>" class="btn btn-sm btn-danger"> <i class="fas fa-trash-alt"></i> Видалити книгу </a>
        </td>
    </tr>
        <%
        }
        %>


    </tbody>
</table>
<div style="margin-top: 277px">
    <%@include file="footer_for_admin.jsp"%>
</body>
</html>
