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
        #container-profile {
            width: 50%;
            height: 700px;
            background-color: #f5f5f5;
            position: relative;
            margin: auto !important;
            overflow: auto;
        }

        .imagePreview {
            width: 100%;
            height: 250px;
            background-position: center center;
            background-color: #fff;
            background-size: cover;
            background-repeat: no-repeat;
            display: block;
            box-shadow: 2px 2px rgba(0, 0, 0, 0.2);
            position: relative;

        }

        .uploadBtn {
            display: block;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            box-shadow: 0px 4px 6px 2px rgba(0, 0, 0, 0.2);
            background-color: #4bd7ef;
            line-height: 40px;
            position: absolute;
            text-align: center;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: none;
            color: white;
        }

        .uploadBtn:hover {
            background-color: #436C72FF;
            cursor: pointer;
        }

        .del {
            position: absolute;
            top: 0px;
            right: 0px;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            background-color: rgba(255, 255, 255, 0.6);
            cursor: pointer;
        }

        .error {
            color: red;
        }
    </style>

    <script>

        $(document).ready(function () {
            $.ajax({
                type: "GET",
                url: "/get-userimage",
                dataType: "json",
                success: function (msg) {
                    alert("Save Success");
                    // lấy danh sách image
                    // var reader = new FileReader();
                },
                error: function (err) {
                    alert("Save Failed");
                }
            });
            $(document).on("click", "i.del", function () {
                $(this).parent().remove();
            });
            $(function () {
                $(document).on("change", ".uploadFile", function () {
                    var uploadFile = $(this);
                    // var files = !!this.files ? this.files : [];
                    // if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
                    if (/^image/.test("D:\\img\\dmq1.jpg".type)) {
                        // only image file
                        var reader = new FileReader(); // instance of the FileReader
                        reader.readAsDataURL("D:\\img\\dmq1.jpg"); // read the local file

                        reader.onloadend = function () {
                            // set image data as background of div
                            uploadFile
                                .closest(".imgUp")
                                .find(".imagePreview")
                                .css("background-image", "url(" + this.result + ")");

                            uploadFile
                                .closest(".imgUp")
                                .find(".imagePreview")
                                .children(".uploadBtn").css("display", "none");

                            uploadFile
                                .closest(".imgUp")
                                .find(".imagePreview").append('<i class="fa fa-times del"></i>');

                            uploadFile
                                .closest(".row")
                                .children(".imgUp")
                                .last()
                                .after('<div class="col-md-3 imgUp"><div class="imagePreview"><label class="uploadBtn fa fa-plus"><input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;"></label></div></div>'
                                );
                        };
                    }
                });
            });
        });

        // $(document).ready(function () {
        //     $("#profile").validate({
        //         rules: {
        //             name: {
        //                 required: true
        //             },
        //             gender: {
        //                 required: true
        //             },
        //             birthday: {
        //                 required: true
        //             },
        //             city: {
        //                 required: true
        //             },
        //             education: {
        //                 required: true
        //             },
        //             career: {
        //                 required: true
        //             }, introduce: {
        //                 required: true
        //             }
        //         },
        //         messages: {
        //             name: {
        //                 required: "Please enter your name"
        //             },
        //             gender: {
        //                 required: "Select your gender"
        //             },
        //             birthday: {
        //                 required: "Select your date of birth"
        //             },
        //             city: {
        //                 required: "Please enter your location"
        //             },
        //             education: {
        //                 required: "Select your education"
        //             },
        //             career: {
        //                 required: "Select your career"
        //             }, introduce: {
        //                 required: "Please enter introduce yourself"
        //             }
        //         },
        //         submitHandler: function () {
        //             var data = serializeArrayToObject($("#profile"));
        //             $.ajax({
        //                 type: "POST",
        //                 url: "/create_profile",
        //                 data: JSON.stringify(data),
        //                 contentType: "application/json",
        //                 dataType: "json",
        //                 success: function (msg) {
        //                     alert("Save Success");
        //                     window.location.href = "/encounters"
        //                 },
        //                 error: function (err) {
        //                     alert("Save Failed");
        //                 }
        //             });
        //         }
        //     });
        // })

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
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div id="container-profile">
    <h4>Upload Image</h4>
    <hr>
    <div class="container-fluid ">
        <form id="user-images">
            <input type="text" name="id_account" hidden
                   value="<sec:authentication property="principal.id_account"></sec:authentication>">
            <div class="row">
                <div class="col-md-3 imgUp">
                    <div class="imagePreview">
                        <label class="uploadBtn fa fa-plus">
                            <input type="file" class="uploadFile img" value="" name="files"
                                   style="width: 0px;height: 0px;overflow: hidden;">
                        </label>
                    </div>
                </div><!-- col-2 -->
            </div><!-- row -->
            <button hidden id="button1" type="submit"></button>
        </form>
    </div><!-- container -->
    <h4>Personal Information</h4>
    <hr>
    <div class="container-fluid ">
        <form id="profile">
            <div class="row">
                <div class="col-sm-12">
                    <input type="text" name="id_account" hidden="true"
                           value="<sec:authentication property="principal.id_account"></sec:authentication>">
                </div>
                <div class="col-sm-6">
                    <label for="firstName" class="form-label">Name</label>
                    <input type="text" class="form-control" id="firstName" name="name" placeholder="Your first name"
                           value="${userDetailsEntities.name}">
                </div>
                <div class="col-sm-6">
                    <div class="form-label">Gender</div>
                    <select class="form-select" id="gender" name="gender">
                        <option value="" disabled selected>Select your option</option>
                        <option selected="selected">${userDetailsEntities.gender}</option>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="dateOfBirth" class="form-label">Birthday</label>
                    <input type="date" class="form-control" id="dateOfBirth" name="birthday"
                           value="${userDetailsEntities.birthday}">
                </div>
                <div class="col-sm-6">
                    <label for="address" class="form-label">Your city</label>
                    <input type="text" class="form-control" id="address" name="city"
                           placeholder="Type your location" value="${userDetailsEntities.city}">
                </div>
                <div class="col-md-6">
                    <label for="education" class="form-label">Education</label>
                    <select class="form-select" id="education" name="education">
                        <option value="" disabled selected>Select your option</option>
                        <option selected="selected">${userDetailsEntities.education}</option>
                        <option>College</option>
                        <option>University</option>
                        <option>Masters</option>
                        <option>PhD</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="career" class="form-label">Career</label>
                    <select class="form-select" id="career" name="career">
                        <option value="" disabled selected>Select your option</option>
                        <option selected="selected">${userDetailsEntities.career}</option>
                        <option>Nghệ thuật</option>
                        <option>Kinh doanh</option>
                        <option>Kỹ thuật</option>
                        <option>Luật pháp</option>
                        <option>Y dược</option>
                        <option>Giáo dục</option>
                        <option>Báo chí</option>
                        <option>Giải trí</option>
                        <option>Truyền thông</option>
                        <option>Ẩm thực</option>
                        <option>Hành chính</option>
                        <option>Thể thao</option>
                        <option>Công an</option>
                        <option>Quân đội</option>
                        <option>Xây dựng</option>
                        <option>Tài chính</option>
                        <option>Ngân hàng</option>
                        <option>CNTT</option>
                        <option>Nông nghiệp</option>
                        <option>Vận tải</option>
                        <option>Du lịch</option>
                        <option>Sinh viên</option>
                        <option>Chưa đi làm</option>
                        <option>Khác</option>
                    </select>
                </div>
                <div class="col-sm-12">
                    <label for="introduce" class="form-label">About me</label>
                    <input type="text" class="form-control" id="introduce" placeholder="Introduce yourself"
                           name="introduce" value="${userDetailsEntities.introduce}">
                </div>
                <div class="col-md-5"></div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary btn-lg" style="margin-top: 20px">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>