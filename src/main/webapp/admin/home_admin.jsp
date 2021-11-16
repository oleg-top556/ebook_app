<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Адмін: Головна сторінка </title>
    <%@include file="allCss_for_admin.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body style="background-color: #e6e8eb">
<%@include file="navbar_for_admin.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                            <h4>Добавити книги</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="all_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-danger"></i><br>
                            <h4>Всі Книги</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-open fa-3x text-warning"></i><br>
                            <h4>Замовлення</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter" >
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                            <h4>Вихід</h4>
                            -----------
                        </div>
                    </div>
                    </a>
                </div>
            </div>
        </div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="text-center">
                    <h4> Ви дійсно бажаєте вийти? </h4>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрити</button>
                    <a href="../logout" type="button" class="btn btn-primary text-white">Вихід</a>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!-- end logout modal  -->
<div style="margin-top: 262px">
<%@include file="footer_for_admin.jsp"%>
</div>
</body>
</html>
