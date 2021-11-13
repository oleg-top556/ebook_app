<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color: #e6e8eb">
<%@include file="all_component/navbar.jsp" %>
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
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <form>
                            <h3 class="text-center text-success">Your Details for Order </h3>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputName4">Name</label>
                                    <input type="text" class="form-control"
                                           id="inputName4" value="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="email" class="form-control"
                                           id="inputEmail4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPhone4">Mobile phone</label>
                                    <input type="number" class="form-control"
                                           id="inputPhone4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputAddress4">Address</label>
                                    <input type="text" class="form-control"
                                           id="inputAddress4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputRegion4">Region</label>
                                    <input type="text" class="form-control"
                                           id="inputRegion4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputCity4">City</label>
                                    <input type="text" class="form-control"
                                           id="inputCity4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputDistrict4">District</label>
                                    <input type="text" class="form-control"
                                           id="inputDistrict4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputZip4">Zip</label>
                                    <input type="number" class="form-control"
                                           id="inputZip4" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputState">Payment Type</label>
                                <select id="inputState" class="form-control">
                                    <option>--Select--</option>
                                    <option>Cash on delivery</option>
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
