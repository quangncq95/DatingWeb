<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <style>
        .modal-dialog {
            top: 200px;
            left: 500px;
        }

        .error {
            color: red;
        }

        .body {
            background-image: url("/images/background.png");
        }
    </style>
</head>
<body class="body">
<header class="p-3 text-white" style="background-color : #ffc0cb ;opacity: 0.7">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/encounters" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            </ul>
            <div class="text-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignUp">
                    Sign-up
                </button>
            </div>
        </div>
    </div>
</header>

<%--<div class="modal" id="modalLogin">--%>
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
            </div>

            <!-- Modal body -->
            <form id="login">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="col-md-12 " style="margin-bottom:8px">
                                <input type="email" class="form-control" name="username" id="LoginEmail"
                                       placeholder="Email Address">
                            </div>
                            <div class="col-md-12">
                                <input type="password" class="form-control" name="password" id="LoginPassword"
                                       placeholder="Password">
                            </div>
                            <div class="col-md-12">
                                <p style="color: red">${message}</p>
                            </div>
                            <div class="col-md-12">
                                <a style="color: deepskyblue" href="/home">Forgot password?</a>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" formmethod="post"
                                        formaction="/j_spring_security_check">Login
                                </button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Modal footer -->
        </div>
    </div>
<%--</div>--%>

<!-- The Modal -->
<div class="modal" id="modalSignUp">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Sign-up</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form id="registration">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <label>Email</label>
                            <div class="col-md-12" style="margin-bottom:8px">
                                <input type="text" class="form-control" name="email"
                                       placeholder="Email">
                            </div>
                            <label>Password</label>
                            <div class="col-md-12">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Create your password">
                            </div>
                            <label>Confirm Password</label>
                            <div class="col-md-12">
                                <input type="password" class="form-control" name="re_password"
                                       placeholder="Confirm password">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Create Account</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#registration").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                re_password: {
                    required: true,
                    equalTo: "#password"
                }
            },
            messages: {
                email: {
                    required: "Please fill in your email",
                    email: "Incorrect email address"
                },
                password: {
                    required: "Enter your password",
                    minlength: "Password must be at least 5 characters"
                },
                re_password: {
                    required: "Retype the password",
                    equalTo: "Does not match the password"
                }
            },
            submitHandler: function () {
                var data = serializeArrayToObject($("#registration"));
                $.ajax({
                    type: "POST",
                    url: "/create",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (msg) {
                        alert("Sign Up Success");
                        window.location.href = "/profile"
                    },
                    error: function (err) {
                        alert("Sign Up Failed");
                    }
                });
            }
        });
    })
    function serializeArrayToObject($form) {
        var array = $form.serializeArray();
        var result = {};
        for (var i = 0; i < array.length; i++) {
            if (array[i].name != null && array[i].name != undefined) {
                result[array[i].name] = array[i].value;
            }
        }
        return result;
    }
</script>
</body>
</html>