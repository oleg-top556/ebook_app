<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Адмін: Добавити Книги </title>
    <%@include file="allCss_for_admin.jsp"%>
</head>
<body style="background-color: #e6e8eb">
<%@include file="navbar_for_admin.jsp"%>
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>
<div class="container p-3">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center"> Добавити книги </h4>

                    <c:if test="${not empty successMsg}">
                            <p class="text-center text-success"> ${successMsg}</p>
                        <c:remove var="successMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger"> ${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session" />
                    </c:if>

                    <form action="../add_books" method="post"
                          enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="exampleInputName">Назва книги  </label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" name="bname_admin">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Автор книги  </label>
                            <input type="text" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" name="author_admin">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Ціна книги </label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp"  name="price_admin">
                        </div>
                        <div class="form-group">
                            <label for="inputState">Катеогорії Книг</label>
                            <select id="inputState" class="form-control" name="categories_admin">
                                <option selected>--select--</option>
                                <option value="New"> Нова книга  </option>
                                <option value="Old"> Засторіла книга </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputStatus">Статус Книги </label>
                            <select id="inputStatus" class="form-control" name="bstatus_admin">
                                <option selected>--select--</option>
                                <option value="Active"> Активна </option>
                                <option value="Inactive"> Неактивна </option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlFile1"> Загрузити фото</label>
                            <input name="bimg_admin" type="file" class="form-control-file"
                            id="exampleFormControlFile1">
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"> Добавити </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 0px">
    <%@include file="footer_for_admin.jsp"%>
</body>
</html>
