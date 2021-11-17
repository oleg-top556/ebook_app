<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page import="com.ebook.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Деталі книги</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>

<%
    User u = (User) session.getAttribute("userobj");
%>

    <%
    int bid= Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
        BookDtls bookDtls = dao.getBookById(bid);


    %>


<div class="container p-3">
    <div class="row">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="book/<%= bookDtls.getPhotoName()%>" style="height: 200px; width: 150px"><br>
            <h4 class="mt-3"> Назва книг: <span class="text-success"><%= bookDtls.getBook_name()%></span></h4>
            <h4> Автор книг:<span class="text-success"><%= bookDtls.getAuthor()%></span> </h4>
            <h4> Категорії: <span class="text-success"><%= bookDtls.getBook_category()%></span> </h4>

        </div>
        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%= bookDtls.getBook_name()%></h2>

            <%
                if ("Old".equals(bookDtls.getBook_category()))
                {%>
            <h5 class="text-primary">Контакти з продавцем </h5>
                <h5 class="text-primary"><i class="far fa-envelope"></i> Пошта: <%=bookDtls.getEmail()%></h5>
            <%
                }
            %>


            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-money-bill-alt fa-2x"></i>
                    <p> Оплата готівкою </p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-undo-alt fa-2x"></i>
                    <p> Можливість повернення</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fas fa-truck-moving fa-2x"></i>
                    <p>Безкоштовна доставка</p>
                </div>

            </div>

            <%
                if ("Old".equals(bookDtls.getBook_category()))
                {%>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success"> <i class="fas fa-cart-plus"></i> Продовження покупок </a>
                <a href="" class="btn btn-danger"> 200 <i class="fas fa-dollar-sign"> </i> </a>
            </div>
            <%
                }else {%>

            <% if (u==null)
            {%>
            <a href="login.jsp" class="btn btn-danger btn-sm ml-2"> Корзина </a>
            <%} else {%>
            <div class="text-center p-3">
                <a href="cart?bid=<%=bookDtls.getBook_id()%>&&uid=<%=u.getId()%>" class="btn btn-success"> <i class="fas fa-cart-plus"></i> Корзина</a>
                <a href="" class="btn btn-danger"> 200 <i class="fas fa-dollar-sign"> </i> </a>
            </div>
            <%
                }
            %>

            <%}
            %>


        </div>

    </div>
</div>
</body>
</html>
