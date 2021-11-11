<%@ page import="java.sql.Connection" %>
<%@ page import="com.ebook.DataBaseConnect.DataBaseConnection" %>
<%@ page import="com.ebook.DAO.BookDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ebook.entity.BookDtls" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook: Index</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .back-img{
            background: url("img/a.jpg") no-repeat;
            height: 50vh;
            width: 100%;
            background-size: cover;
        }
        .crd-ho:hover{
            background: #fcf7f7;
        }

    </style>
</head>
<body style="background-color: #e6e8eb">
    <%@include file="all_component/navbar.jsp" %>
    <div class="container-fluid back-img" >
        <h2 class = "text-white text_h2" style="margin-left: 31.5%">
            <i class="fas fa-book"></i> EBook Management System </h2>
    </div>

<!-- Start Recent Book-->

    <div class="container">
        <h3 class="text-center"> Recent Book </h3>
        <div class="row">
            <%
                BookDAOImpl dao2 = new BookDAOImpl(DataBaseConnection.getConnection());
                List<BookDtls> list2 = dao2.getRecentBook();
                for (BookDtls bookDtls: list2)
                {%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=bookDtls.getPhotoName()%>"
                             style="width: 150px; height: 200px" class="img-thimblin">
                        <p><%= bookDtls.getBook_name()%></p>
                        <p><%= bookDtls.getAuthor()%></p>

                             <%
                            if (bookDtls.getBook_category().equals("Old")) {
                             %>
                        <p>Categories: <%= bookDtls.getBook_category()%></p>
                        <div class="row">
                            <a href="" class="btn btn-success btn-sm ml-5"> View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1">
                                <%=bookDtls.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                        </div>
                            <%
                            }else {%>
                                <p>Categories: <%= bookDtls.getBook_category()%></p>
                        <div class="row">
                            <a href="" class="btn btn-danger btn-sm ml-2"> </i> Add Cart</a>
                            <a href="" class="btn btn-success btn-sm ml-1"> View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1">
                                <%=bookDtls.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                        </div>
                            <%
                            }
                            %>
                    </div>
                </div>
            </div>
                <%
                }
                 %>

        </div>
        <div class="text-center mt-1">
            <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white"> View All</a>
        </div>
    </div>
    <!-- End Recent Book-->


    <hr>

    <!-- Start New Book-->

    <div class="container">
        <h3 class="text-center"> New Book </h3>
        <div class="row">

                <%
                    BookDAOImpl dao = new BookDAOImpl(DataBaseConnection.getConnection());
                    List<BookDtls> list = dao.getNewBook();
                    for (BookDtls bookDtls: list)
                    {%>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=bookDtls.getPhotoName()%>"
                             style="width: 150px; height: 200px" class="img-thimblin">
                        <p><%= bookDtls.getBook_name()%></p>
                        <p><%= bookDtls.getAuthor()%></p>
                        <p>Categories: <%= bookDtls.getBook_category()%></p>
                        <div class="row">
                            <a href="" class="btn btn-danger btn-sm ml-2">  Add Cart</a>
                            <a href="" class="btn btn-success btn-sm ml-1"> View Details</a>
                            <a href="" class="btn btn-danger btn-sm ml-1">
                                <%=bookDtls.getPrice()%>  <i class="fas fa-dollar-sign"></i> </a>
                        </div>
                    </div>
                </div>
            </div>
                    <%
                    }
                    %>

        </div>

        <div class="text-center mt-1">
            <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white"> View All</a>
        </div>
    </div>
    <!-- End New Book-->


    <hr>

    <!-- Start Old Book-->

    <div class="container">
        <h3 class="text-center"> Old Book </h3>
        <div class="row">

                    <%
                        BookDAOImpl dao3 = new BookDAOImpl(DataBaseConnection.getConnection());
                        List<BookDtls> list3 = dao3.getOldBook();
                        for (BookDtls bookDtls: list3)
                        {%>
                    <div class="col-md-3">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt="" src="book/<%=bookDtls.getPhotoName()%>"
                                     style="width: 150px; height: 200px" class="img-thimblin">
                                <p><%= bookDtls.getBook_name()%></p>
                                <p><%= bookDtls.getAuthor()%></p>
                                <p><%=bookDtls.getBook_category()%></p>
                                <div class="row">
                                    <a href="" class="btn btn-success btn-sm ml-5"> View Details</a>
                                    <a href="" class="btn btn-danger btn-sm ml-1">
                                        <%=bookDtls.getPrice()%>  <i class="fas fa-dollar-sign"></i> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>


        </div>

        <div class="text-center mt-1">
            <a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white"> View All</a>
        </div>
    </div>
    <!-- End Old Book-->

<%@include file="all_component/footer.jsp"%>
</body>
</html>
