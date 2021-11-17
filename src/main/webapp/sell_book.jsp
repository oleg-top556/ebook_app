<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell old book</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>
<%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <div class="row p-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-success">Продаж книги</h4>

                        <c:if test="${not empty successMsg}">
                            <p class="text-center text-primary"> ${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger"> ${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

                        <form action="add_old_book" method="post"
                              enctype="multipart/form-data">


                            <input type="hidden" value="${userobj.email}" name="user">

                            <div class="form-group">
                                <label for="exampleInputName">Назва книги </label>
                                <input type="text" class="form-control" id="exampleInputName"
                                       aria-describedby="emailHelp" name="bname_sell">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Автор </label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" name="author_sell">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPhone">Ціна</label>
                                <input type="number" class="form-control" id="exampleInputPhone"
                                       aria-describedby="emailHelp"  name="price_sell">
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlFile1">Загрузка фото</label>
                                <input name="bimg_sell" type="file" class="form-control-file"
                                       id="exampleFormControlFile1">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"> Продаж </button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
<div style="margin-top: 2.0rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
