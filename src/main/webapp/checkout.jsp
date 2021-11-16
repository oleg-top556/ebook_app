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
    <title>Cart</title>
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
                        <h3 class="text-center text-success">Your Selected Books </h3>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Book Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
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
                                       class="btn btn-sm btn-danger"> Remove </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                            <tr>
                                <td>Total Price</td>
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
                        <h3 class="text-center text-success">Your Details for Order </h3>
                        <form action="order" method="post">
                            <input type="hidden" value="${userobj.id}" name="id">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName4">Name</label>
                                    <input type="text" name="username" class="form-control"
                                           id="inputName4" value="${userobj.name}"
                                            readonly="readonly" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="email" name="email" class="form-control"
                                           id="inputEmail4" value="${userobj.email}"
                                           readonly="readonly" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPhone4">Mobile phone</label>
                                    <input type="number" name="phone" class="form-control"
                                           id="inputPhone4" value="${userobj.phone}" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress4">Address</label>
                                    <input type="text" name="address" class="form-control"
                                           id="inputAddress4" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputRegion4">Region</label>
                                    <input type="text" name="region" class="form-control"
                                           id="inputRegion4" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputCity4">City</label>
                                    <input type="text" name="city" class="form-control"
                                           id="inputCity4" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputDistrict4">District</label>
                                    <input type="text" name="district" class="form-control"
                                           id="inputDistrict4" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputZip4">Zip</label>
                                    <input type="number" name="zip_code" class="form-control"
                                           id="inputZip4" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputState">Payment Type</label>
                                <select id="inputState" class="form-control" name="payment">
                                    <option value="noselect">--Select--</option>
                                    <option value="COD">Cash on delivery</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button class="btn btn-warning"> Order Now </button>
                                <a href="index.jsp" class="btn btn-success">Continue shopping</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
</body>
</html>
