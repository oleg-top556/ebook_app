<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вибравити профіль</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-success">Виправити профіль </h4>

                    <c:if test="${not empty failedMsg}">
                        <h5 class="text-center text-danger">${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty successMsg}">
                        <h5 class="text-center text-success">${successMsg}</h5>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>

                    <form action="update_profile" method="post">

                        <input type="hidden" value="${userobj.id}" name="id">

                        <div class="form-group">
                            <label for="exampleInputName">Ім'я </label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" name="name_edit_profile"
                                   value="${userobj.name}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Пошта</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" name="email_edit_profile"
                                   value="${userobj.email}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Телефон</label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp"  name="phone_edit_profile"
                                   value="${userobj.phone}">
                        </div>


                        <div class="form-group">
                            <label for="exampleFormControlFile1"> Введіть свій пароль </label>
                            <input name="password_edit_profile" type="password" class="form-control-file"
                                   id="exampleFormControlFile1">
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"> Обновити </button>
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
