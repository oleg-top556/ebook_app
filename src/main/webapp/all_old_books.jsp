<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Recent Books</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body  style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<style type="text/css">
    .crd-ho:hover{
        background: #fcf7f7;
    }

</style>

<div class="container-fluid">
    <div class="row p-3">

        <%
            BookDAOImpl dao3 = new BookDAOImpl(DataBaseConnection.getConnection());
            List<BookDtls> list3 = dao3.getAllOldBook();
            for (BookDtls bookDtls: list3)
            {%>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=bookDtls.getPhotoName()%>"
                         style="width: 150px; height: 200px" class="img-thimblin">
                    <p><%= bookDtls.getBook_name()%></p>
                    <p><%= bookDtls.getAuthor()%></p>
                    <p><%=bookDtls.getBook_category()%></p>
                    <div class="row">
                        <a href="" class="btn btn-success btn-sm ml-5"> View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1">
                            <%=bookDtls.getPrice()%>  <i class="fas fa-dollar-sign"></i> </a>
                    </div>
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
