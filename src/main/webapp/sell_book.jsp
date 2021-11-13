<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sell old book</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <div class="row p-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-success">Sell old book</h4>
                        <form action="" method="post"
                              enctype="multipart/form-data">

                            <div class="form-group">
                                <label for="exampleInputName">Book Name </label>
                                <input type="text" class="form-control" id="exampleInputName"
                                       aria-describedby="emailHelp" name="bname_sell">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Author Name </label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                       aria-describedby="emailHelp" name="author_sell">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPhone">Price</label>
                                <input type="number" class="form-control" id="exampleInputPhone"
                                       aria-describedby="emailHelp"  name="price_sell">
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlFile1">Upload Photo</label>
                                <input name="bimg_sell" type="file" class="form-control-file"
                                       id="exampleFormControlFile1">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"> Sell </button>
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
