<%@ page import="com.ebook.DAO.CartDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.User" %>
<%@ page import="com.ebook.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Корзина</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"> </c:redirect>
    </c:if>

    <c:if test="${not empty successMsg}">
        <div class="alert alert-success text-center" role="alert">
           ${successMsg}
        </div>
        <c:remove var="successMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty failedMsg}">
        <div class="alert alert-danger text-center" role="alert">
           ${failedMsg}
        </div>
        <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <div class="container">
        <div class="row p-2">
            <div class="col-md-6">
                <div class="card bg-white">
                    <div class="card-body">
                        <h3 class="text-center text-success">Ваші вибрані книжки </h3>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Назва книг</th>
                                <th scope="col">Автор</th>
                                <th scope="col">Ціна</th>
                                <th scope="col">Дії</th>
                            </tr>
                            </thead>
                            <tbody>

                            <%
                                User user = (User) session.getAttribute("userobj");
                                CartDAOImpl dao = new CartDAOImpl(DataBaseConnection.getConnection());
                                List<Cart> cart = dao.getBookByUser(user.getId());
                                Double totalPrice=0.0;
                                for (Cart c : cart) {
                                    totalPrice=c.getTotal_price();
                            %>
                            <tr>
                                <th scope="row"><%=c.getBookName()%></th>
                                <td><%=c.getAuthor()%></td>
                                <td><%=c.getPrice()%></td>
                                <td>
                                    <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
                                       class="btn btn-sm btn-danger"> Видалити </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                            <tr>
                                <td>Ціна в цілому </td>
                                <td></td>
                                <td></td>
                                <td><%=totalPrice%></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Ваші деталі для замовлення </h3>
                        <form action="order" method="post">
                            <input type="hidden" value="${userobj.id}" name="id">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName4">Ім'я</label>
                                    <input type="text" name="username" class="form-control"
                                           id="inputName4" value="${userobj.name}"
                                            readonly="readonly" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Пошта</label>
                                    <input type="email" name="email" class="form-control"
                                           id="inputEmail4" value="${userobj.email}"
                                           readonly="readonly" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPhone4">Мобільний телефон</label>
                                    <input type="number" name="phone" class="form-control"
                                           id="inputPhone4" value="${userobj.phone}" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress4">Адреса</label>
                                    <input type="text" name="address" class="form-control"
                                           id="inputAddress4" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputRegion4">Регіон</label>
                                    <input type="text" name="region" class="form-control"
                                           id="inputRegion4" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputCity4">Місто</label>
                                    <input type="text" name="city" class="form-control"
                                           id="inputCity4" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputDistrict4">Район</label>
                                    <input type="text" name="district" class="form-control"
                                           id="inputDistrict4" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputZip4">Код пошти </label>
                                    <input type="number" name="zip_code" class="form-control"
                                           id="inputZip4" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputState">Тип оплати</label>
                                <select id="inputState" class="form-control" name="payment">
                                    <option value="noselect">--Вибрати--</option>
                                    <option value="COD">Оплата налічкой</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button class="btn btn-warning"> Замовити зараз </button>
                                <a href="index.jsp" class="btn btn-success">Продовжити покупку </a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
</body>
</html>
