<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <link href="/css/background_home.css" rel="stylesheet">
    <style>
        .modal-dialog{
            top : 250px;
            left: 500px;
        }
    </style>
</head>
<body>
<header class="p-3 text-white" style="background-color : #ffc0cb ;opacity: 0.7">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="truelove.png" >
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/home" class="nav-link px-2 text-white" style="font-family: 'Baskerville Old Face';margin-left: 500px;">TRUE LOVE</a></li>
            </ul>
            <div class="text-end">
                    <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignUp">Sign-up</button>
                    <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalLogin">Login</button>
            </div>
        </div>
    </div>
</header>

<!-- The Modal -->
<div class="modal" id="modalSignUp">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Sign-up</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row" style="margin-bottom:8px">
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="Sign-upFirstName" placeholder="First Name" value="" required="">
                        </div>
                        <div class="col-md">
                            <input type="text" class="form-control" id="Sign-upLastName" placeholder="Last Name" value="" required="">
                        </div>
                    </div>
                    <div class="col-md-12 "style="margin-bottom:8px">
                        <input type="text" class="form-control" id="Sign-upEmail" placeholder="Email Address" value="" required="">
                    </div>
                    <div class="col-md-12" style="margin-bottom:8px">
                        <input type="text" class="form-control" id="Sign-upPassword" placeholder="Password" value="" required="">
                    </div>
                    <div class="col-md-12">
                        <input type="text" class="form-control" id="rePassword" placeholder="ReEnter Password" value="" required="">
                    </div>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" formmethod="post" formaction="" >Create Account</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

<div class="modal" id="modalLogin">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="col-md-12 "style="margin-bottom:8px">
                            <input type="text" class="form-control" id="LoginEmail" placeholder="Email Address" value="" required="">
                        </div>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="LoginPassword" placeholder="Password" value="" required="">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" formmethod="post" formaction="" >Login</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

<%--<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>--%>
</body>
</html>