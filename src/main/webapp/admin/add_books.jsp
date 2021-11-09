<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <meta charset="ISO-8859-1">
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
                    <h4 class="text-center"> Add Books </h4>
                    <form action="../AdminAddBookServlet" method="post"
                          enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="exampleInputName">Book Name * </label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" name="bname">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Author Name * </label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" name="author">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Price *</label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp"  name="price">
                        </div>
                        <div class="form-group">
                            <label for="inputCategories">Book Categories</label>
                            <select id="inputCategories" class="form-control" name="btype">
                                <option selected>--select--</option>
                                <option value="New"> New Book </option>
                                <option value="Old"> Old Book </option>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputStatus">Book Status</label>
                            <select id="inputStatus" class="form-control" name="bstatus">
                                <option selected>--select--</option>
                                <option value="Active"> Active </option>
                                <option value="Inactive"> Inactive </option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlFile"> Upload Photo</label>
                            <input name="bimg" type="file" class="form-control-file"
                            id="exampleFormControlFile">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"> Add </button>
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
