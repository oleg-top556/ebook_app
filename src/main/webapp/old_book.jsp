<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.User" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User : Old Book </title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">

<%@include file="all_component/navbar.jsp" %>

<c:if test="${not empty successMsg}">
    <div class="alert alert-success text-center">
        ${successMsg}
    </div>
    <c:remove var="successMsg" scope="session" />
</c:if>

<div class="container p-5">
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>

        <%
            User user = (User) session.getAttribute("userobj");
            String email = user.getEmail();

            BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
            List<BookDtls> list = dao.getBookByOldId(email,"Old");
            for (BookDtls bookDtls: list)
            {%>
            <tr>
                <td><%=bookDtls.getBook_name()%></td>
                <td><%=bookDtls.getAuthor()%></td>
                <td><%=bookDtls.getPrice()%></td>
                <td><%=bookDtls.getBook_category()%></td>
                <td><a href="delete_old_book?em=<%=email%>&&id=<%=bookDtls.getBook_id()%>" class="btn btn-sm btn-danger"> Delete </a> </td>
             </tr>
            <%
            }
            %>


        </tbody>
    </table>
</div>

</body>
</html>