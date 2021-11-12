<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Details</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>

    <%
    int bid= Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
        BookDtls bookDtls = dao.getBookById(bid);


    %>


<div class="container p-3">
    <div class="row">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="book/<%= bookDtls.getPhotoName()%>" style="height: 200px; width: 150px"><br>
            <h4 class="mt-3"> Book name: <span class="text-success"><%= bookDtls.getBook_name()%></span></h4>
            <h4> Author name:<span class="text-success"><%= bookDtls.getAuthor()%></span> </h4>
            <h4> Category: <span class="text-success"><%= bookDtls.getBook_category()%></span> </h4>

        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%= bookDtls.getBook_name()%></h2>

            <%
                if ("Old".equals(bookDtls.getBook_category()))
                {%>
            <h5 class="text-primary">Contact to seller</h5>
                <h5 class="text-primary"><i class="far fa-envelope"></i> Email: <%=bookDtls.getEmail()%></h5>
            <%
                }
            %>


            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-money-bill-alt fa-2x"></i>
                    <p> Cash on delivery</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p> Return available</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <p>Free shipping</p>
                </div>

            </div>

            <%
                if ("Old".equals(bookDtls.getBook_category()))
                {%>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success"> <i class="fas fa-cart-plus"></i> Continue Shopping </a>
                <a href="" class="btn btn-danger"> 200 <i class="fas fa-dollar-sign"> </i> </a>
            </div>
            <%
                }else {%>
            <div class="text-center p-3">
                <a href="" class="btn btn-success"> <i class="fas fa-cart-plus"></i> Add Cart</a>
                <a href="" class="btn btn-danger"> 200 <i class="fas fa-dollar-sign"> </i> </a>
            </div>
            <%}
            %>


        </div>

    </div>
</div>
</body>
</html>
