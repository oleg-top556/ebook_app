<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ebook.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Recent Books</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body  style="background-color: #e6e8eb">
<%
    User u = (User) session.getAttribute("userobj");
%>
<%@include file="all_component/navbar.jsp" %>
<style type="text/css">
    .crd-ho:hover{
        background: #fcf7f7;
    }

</style>

<div class="container-fluid">

    <div class="row p-3">

            <%
                BookDAOImpl dao2 = new BookDAOImpl(DataBaseConnection.getConnection());
                List<BookDtls> list2 = dao2.getAllRecentBook();
                for (BookDtls bookDtls: list2)
                {%>
            <div class="col-md-3">
                <div class="card crd-ho mt-2">

                    <div class="card-body text-center">
                        <img alt="" src="book/<%=bookDtls.getPhotoName()%>"
                             style="width: 150px; height: 200px" class="img-thimblin">
                        <p><%= bookDtls.getBook_name()%></p>
                        <p><%= bookDtls.getAuthor()%></p>

                        <%
                            if (bookDtls.getBook_category().equals("Old")) {
                        %>
                        <p>Categories: <%= bookDtls.getBook_category()%></p>
                        <div class="row">
                            <a href="view_books.jsp?bid=<%=bookDtls.getBook_id()%>" class="btn btn-success btn-sm ml-5"> View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1">
                                <%=bookDtls.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                        </div>
                        <%
                        }else {%>
                        <p>Categories: <%= bookDtls.getBook_category()%></p>
                        <div class="row">

                            <% if (u==null)
                            {%>
                            <a href="login.jsp" class="btn btn-danger btn-sm ml-2">  Add Cart</a>
                            <%} else {%>
                            <a href="cart?bid=<%=bookDtls.getBook_id() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">  Add Cart</a>
                            <%
                                }
                            %>

                            <a href="view_books.jsp?bid=<%=bookDtls.getBook_id()%>" class="btn btn-success btn-sm ml-2"> View Details</a>

                            <a href="" class="btn btn-danger btn-sm ml-2">
                                <%=bookDtls.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                }
            %>

    </div>
</div>



</body>
</html>
