<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Add Books</title>
    <%@include file="allCss_for_admin.jsp"%>
</head>
<body style="background-color: #e6e8eb">
<%@include file="navbar_for_admin.jsp"%>
<div class="container p-3">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center"> Edit Books </h4>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
                        BookDtls bookDtls= dao.getBookById(id);
                    %>

                    <form action="../editbooks" method="post">
                        <input type="hidden" name="id" value="<%=bookDtls.getBook_id()%>">

                        <div class="form-group">
                            <label for="exampleInputName">Book Name * </label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" name="bname_admin"
                                   value="<%=bookDtls.getBook_name()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Author Name * </label>
                            <input type="text" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" name="author_admin"
                                   value="<%=bookDtls.getAuthor()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Price *</label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp"  name="price_admin"
                                   value="<%=bookDtls.getPrice()%>">
                        </div>

                        <div class="form-group">
                            <label for="inputStatus">Book Status</label>
                            <select id="inputStatus" class="form-control" name="bstatus_admin">
                                <% if ("Active".equals(bookDtls.getStatus())){%>
                                <option value="Active"> Active </option>
                                <option value="Inactive"> Inactive </option>
                                <%}else {%>
                                <option value="Inactive"> Inactive </option>
                                <option value="Active"> Active </option>
                                <%}%>
                            </select>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"> Update </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 25px">
    <%@include file="footer_for_admin.jsp"%>
</body>
</html>
