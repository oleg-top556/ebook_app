<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit profile</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-success">Edit profile </h4>
                    <form action="" method="post"
                          enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="exampleInputName">Name * </label>
                            <input type="text" class="form-control" id="exampleInputName"
                                   aria-describedby="emailHelp" name="name_edit_profile">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address * </label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" name="email_edit_profile">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPhone">Phone *</label>
                            <input type="number" class="form-control" id="exampleInputPhone"
                                   aria-describedby="emailHelp"  name="phone_edit_profile">
                        </div>


                        <div class="form-group">
                            <label for="exampleFormControlFile1"> Password* </label>
                            <input name="password_edit_profile" type="password" class="form-control-file"
                                   id="exampleFormControlFile1">
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
<div style="margin-top: 2.0rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
