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
    <title>Admin: All Books</title>
    <%@include file="allCss_for_admin.jsp"%>
</head>
<body>
<%@include file="navbar_for_admin.jsp"%>
<h3 class="text-center"> Hello Admin </h3>

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
        <th scope="col">ID</th>
        <th scope="col">Image</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Categories</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
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
            <a href="edit_books.jsp?id=<%=bookDtls.getBook_id()%>" class="btn btn-sm btn-primary"> Edit</a>
            <a href="../delete?id=<%=bookDtls.getBook_id()%>" class="btn btn-sm btn-danger"> Delete</a>
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
