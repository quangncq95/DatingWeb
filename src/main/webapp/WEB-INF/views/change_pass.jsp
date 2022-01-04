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
        .error{
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
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            </ul>
        </div>
    </div>
</header>

<div>
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Change Password</h4>
                <button type="button" class="btn-close"></button>
            </div>

            <!-- Modal body -->
            <form id="change_pass">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <label>Current Password</label>
                            <div class="col-md-12 " style="margin-bottom:8px">
                                <input type="text" class="form-control" name="current_password"
                                       placeholder="Current Password">
                            </div>
                            <label>New Password</label>
                            <div class="col-md-12">
                                <input type="password" class="form-control" id="new_password" name="new_password"
                                       placeholder="New Password">
                            </div>
                            <label>Retype New Password</label>
                            <div class="col-md-12">
                                <input type="password" class="form-control" name="retype_new_password"
                                       placeholder="Retype New Password">
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save Change
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <a style="color: #ffff" href="/encounters">Cancel</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Modal footer -->
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#change_pass").validate({
            rules: {
                current_password: {
                    required: true,
                    minlength: 5,
                },
                new_password: {
                    required: true,
                    minlength: 5
                },
                retype_new_password: {
                    required: true,
                    equalTo: "#new_password"
                }
            },
            submitHandler: function () {
                var data = serializeArrayToObject($("#change_pass"));
                $.ajax({
                    type: "POST",
                    url: "/change_password",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (response) {
                        alert(response.data);
                        window.location.href="/encounters"
                    },
                    error: function (err) {
                        alert("Thất bại");
                    }
                });
            }
        })
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