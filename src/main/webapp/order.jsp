<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Book </title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
    <div class="container p-3">
        <h3 class="text-center text-primary"> Your Order </h3>
        <table class="table table-striped mt-3">
            <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>@mdo</td>
                <td>@mdo</td>
            </tr>


            </tbody>
        </table>
    </div>


</body>
</html>