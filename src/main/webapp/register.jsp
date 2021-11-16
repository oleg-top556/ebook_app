<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Реєстрація</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Реєстрація</h4>

                    <c:if test="${not empty successMsg}">
                        <h5 class="text-center text-success">${successMsg}</h5>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty failed_reg}">
                        <h5 class="text-center text-danger">${failed_reg}</h5>
                        <c:remove var="failed_reg" scope="session" />
                    </c:if>

                    <form action="register" method="post">
                        <div class="form-group">
                            <label for="exampleInputName">Введіть повне ім'я</label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" required="required" name="fname">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Пошта</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" required="required" name="email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Номер телефону</label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp" required="required" name="phone">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Пароль</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   required="required" name = "password">
                        </div>
                        <div class="form-check">
                            <input type="checkbox", class="form-check-input" name="check"
                            id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">
                            Погоджуюсь з правилами суспільства </label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Зареєструватись</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>

</body>
</html>
