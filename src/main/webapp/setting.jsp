<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Настройка</title>
    <%@include file="all_component/allCss.jsp" %>
</head>

<style type="text/css">
    a {
        text-decoration: none;
        color: black;
    }
    a:hover{
        text-decoration: none;
    }
</style>
<body style="background-color: #e6e8eb">

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_component/navbar.jsp" %>

<div class="container">

        <h3 class="text-center p-3">Привіт, ${userobj.name} </h3>


    <div class="row p-3">
        <div class="col-md-4">
            <a href="sell_book.jsp" >
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                        <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4> Продаж книги </h4>
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md-4">
            <a href="old_book.jsp" >
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4> Всі книжки для продажу </h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="edit_profile.jsp" >
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-user-edit fa-3x"></i>
                        </div>
                        <h4> Виправити профіль </h4>
                    </div>
                </div>
            </a>
        </div>




        <div class="col-md-6 mt-3">
            <a href="order.jsp" >
                <div class="card">
                    <div class="card-body text-center ">
                        <div class="text-danger">
                            <i class="fas fa-box-open fa-3x"></i>
                        </div>
                        <h4> Мої замовлення </h4>
                        <p> Відстеження замовлень</p>
                    </div>
                </div>
            </a>
        </div>


        <div class="col-md-6 mt-3">
            <a href="helpline.jsp" >
                <div class="card">
                    <div class="card-body text-center ">
                        <div class="text-success">
                            <i class="fas fa-user-circle fa-3x"></i>
                        </div>
                        <h4> Центр допомоги </h4>
                        <p>Цілодобово</p>
                    </div>
                </div>
            </a>
        </div>



    </div>
</div>

<div style="margin-top: 7.4rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
