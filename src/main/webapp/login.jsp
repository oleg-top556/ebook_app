<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вхід</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Вхід</h4>

                    <c:if test="${not empty failedMsg}">
                        <h5 class="text-center text-danger">${ failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty succMsg}">
                        <h5 class="text-center text-success">${ succMsg}</h5>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>


                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Пошта</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   ria-describedby="emailHelp" required="required" name="email" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Пароль</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   required="required" name="password">
                        </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Вхід</button><br>
                                <a href="register.jsp"> Зареєструватись </a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 10.8rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
