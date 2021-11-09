<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ebook: Login</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Sigh In</h4>
                    <form>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   ria-describedby="emailHelp" required="required" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required">
                        </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Sigh in</button><br>
                                <a href="register.jsp"> Create Account</a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 10.8rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>
