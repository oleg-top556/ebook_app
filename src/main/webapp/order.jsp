<%@ page import="com.ebook.entity.User" %>
<%@ page import="com.ebook.DAO.BookOrderImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookOrder" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Замовити книжки </title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"> </c:redirect>
</c:if>
<%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <h3 class="text-center text-primary"> Ваші замовлення </h3>
        <table class="table table-striped mt-3">
            <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Номер замовлення</th>
                <th scope="col">Ім'я</th>
                <th scope="col">Назва книжки</th>
                <th scope="col">Автор</th>
                <th scope="col">Ціна</th>
                <th scope="col">Тип оплати</th>
            </tr>
            </thead>
            <tbody>

            <%
            User user = (User) session.getAttribute("userobj");
            BookOrderImpl dao = new BookOrderImpl(DataBaseConnection.getConnection());
            List<BookOrder> bookOrderList = dao.getBook(user.getEmail());
            for (BookOrder b:bookOrderList)
            {%>
            <tr>
                <th scope="row"><%=b.getOrder()%></th>
                <td><%=b.getUser_name()%></td>
                <td><%=b.getBookName()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getPaymentType()%></td>
            </tr>
            <%
            }
            %>


            </tbody>
        </table>
    </div>


</body>
</html>
