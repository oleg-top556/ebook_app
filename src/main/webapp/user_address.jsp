<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Address </title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
    <div class="row p-3">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Add address</h3>

                   <form action="">
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="inputAddress4">Address</label>
                            <input type="text" class="form-control"
                                   id="inputAddress4">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputRegion4">Region</label>
                            <input type="text" class="form-control"
                                   id="inputRegion4">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputCity4">City</label>
                            <input type="text" class="form-control"
                                   id="inputCity4">
                        </div>


                        <div class="form-group col-md-4">
                            <label for="inputDistrict4">District</label>
                            <input type="text" class="form-control"
                                   id="inputDistrict4">
                        </div>

                        <div class="form-group col-md-4">
                            <label for="inputZip4">Zip code</label>
                            <input type="number" class="form-control"
                                   id="inputZip4">
                        </div>
                    </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-warning"> Add address </button>
                        </div>

                   </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div style="margin-top: 12.0rem"></div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>