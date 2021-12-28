<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

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

        .body {
            background-image: url("/images/background.png");
        }
    </style>
</head>
<body class="body">
<header class="p-3 text-white" style="background-color : #ffc0cb ;opacity: 0.7">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            </ul>
            <div class="text-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignUp">
                    Sign-up
                </button>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalLogin">
                    Login
                </button>
            </div>
        </div>
    </div>
</header>

<div class="modal" id="modalLogin">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <form>
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="col-md-12 " style="margin-bottom:8px">
                                <input type="text" class="form-control" name="username" id="LoginEmail"
                                       placeholder="Email Address" value="" required="">
                            </div>
                            <div class="col-md-12">
                                <input type="password" class="form-control" name="password" id="LoginPassword"
                                       placeholder="Password" value="" required="">
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
</div>

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
            <form id="registration">
                <div class="modal-body">
                    <div class="container-fluid">
                        <label>Name</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" name="name" placeholder="Your first name">
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Birthday</label>
                                <div class="col-md-12">
                                    <input type="date" name="bday">
                                </div>
                            </div>
                            <div class="col-6">
                                <label>Gender</label>
                                <div class="col-md-12">
                                    <select class="form-select" aria-label="Default select example" name="gender">
                                        <option value="" disabled selected hidden>Choose Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Femal</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <label>Your city</label>
                        <div class="col-md-12" style="margin-bottom:8px">
                            <input type="text" class="form-control" name="location"
                                   placeholder="Type your location">
                        </div>
                        <label>Email</label>
                        <div class="col-md-12" style="margin-bottom:8px">
                            <input type="text" class="form-control" name="email"
                                   placeholder="Email">
                        </div>
                        <label>Password</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" id="password" name="password"
                                   placeholder="Create your password">
                        </div>
                        <label>Confirm Password</label>
                        <div class="col-md-12">
                            <input type="text" class="form-control" name="re_password" placeholder="Confirm password">
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" formmethod="post" formaction="/create">Create
                                Account
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Modal footer -->


        </div>
    </div>
</div>

<%--<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>--%>


<script>


    $(document).ready(function () {
        $("#registration").validate({
            rules: {
                name: {
                    required: true
                },
                bday: {
                    required: true
                },
                gender: {
                    required: true
                },
                location: {
                    required: true
                },
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
                name: {
                    required: "Please enter your name"
                },
                bday: {
                    required: "Select your date of birth"
                },
                gender: {
                    required: "Select your gender"
                },
                location: {
                    required: "Select your location"

                },
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
                        alert("Lưu thành công");
                    },
                    error: function (err){
                        alert("Lưu thất bại");
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