<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="container-fluid" style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 ">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3> <i class="fas fa-book"></i> Книжки </h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search_book.jsp" method="post">
                <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Пошук" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Пошук</button>
            </form>
        </div>

        <c:if test="${not empty userobj}">
            <div class="col-md-3" >

                <a href="checkout.jsp" class="btn btn-danger  text-white"> <i class="fas fa-cart-plus fa-1x"></i> Кошик </a>

                <a href="index.jsp" class="btn btn-success">
                    <i class="fas fa-user"></i> ${userobj.name}</a>

                <a href="logout" class="btn btn-primary">
                     Вихід <i class="fas fa-sign-in-alt"></i> </a>
            </div>

        </c:if>


        <c:if test="${empty userobj}">

            <div class="col-md-3">
                <a href="login.jsp" class="btn btn-success">
                    <i class="fas fa-sign-in-alt"></i> Вхід</a>

                <a href="register.jsp" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Реєстрація</a>
            </div>

        </c:if>

    </div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-home"></i> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon" ></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Додому <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fas fa-book-open"></i> Недавні книжки</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"> <i class="fas fa-book-open"></i> Нові книжки</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link disabled" href="all_old_books.jsp"><i class="fas fa-book-open"></i> Книжки інших продавців </a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">

            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
                <i class="fas fa-cogs"></i> Налаштування </a>
            <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
                <i class="fas fa-phone"></i> Контакти </a>
        </form>
    </div>
</nav>