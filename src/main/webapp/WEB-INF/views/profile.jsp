<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <style>
        #container-profile{
            width:50%;
            height: 700px;
            background-color:#f5f5f5;
            position:relative;
            margin: auto !important;
            overflow: auto;
        }

        .imagePreview {
            width : 100%;
            height: 250px;
            background-position: center center;
            background-color:#fff;
            background-size: cover;
            background-repeat:no-repeat;
            display: block;
            box-shadow:2px 2px rgba(0,0,0,0.2);
            position:relative;

        }
        .uploadBtn
        {
            display:block;
            width : 40px;
            height : 40px;
            border-radius:50%;
            box-shadow:0px 4px 6px 2px rgba(0,0,0,0.2);
            background-color:#4bd7ef;
            line-height:40px;
            position:absolute;
            text-align:center;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border:none;
            color:white;
        }
        .uploadBtn:hover
        {
            background-color: #436C72FF;
            cursor:pointer;
        }
        .del
        {
            position:absolute;
            top:0px;
            right:0px;
            width:30px;
            height:30px;
            text-align:center;
            line-height:30px;
            background-color:rgba(255,255,255,0.6);
            cursor:pointer;
        }
    </style>

    <script>
        $(document).ready(function () {
            $(document).on("click", "i.del", function () {
                $(this).parent().remove();
            });
            $(function () {
                $(document).on("change", ".uploadFile", function () {
                    var uploadFile = $(this);
                    var files = !!this.files ? this.files : [];
                    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

                    if (/^image/.test(files[0].type)) {
                        // only image file
                        var reader = new FileReader(); // instance of the FileReader
                        reader.readAsDataURL(files[0]); // read the local file

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

    </script>
</head>
<body>

<header class="p-3 text-white" style="background-color : #ffc0cb ">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-between ">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>
            <div class="flex-shrink-0 dropdown">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="images/nhd.png" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <form action="/doLogout" method="post">
                            <input class="dropdown-item" type="submit" value="Logout"/>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<div id="container-profile">
    <h2>Upload Image</h2>
    <hr>
    <div class="container-fluid ">
        <div class="row">
            <div class="col-md-3 imgUp">
                <div class="imagePreview">
                    <label class="uploadBtn fa fa-plus"><input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;">
                    </label>
                </div>
            </div><!-- col-2 -->
        </div><!-- row -->
    </div><!-- container -->
    <h2>Personal Information</h2>
    <hr>
    <div class="container-fluid ">
        <div class="row">
                <div class="col-sm-6">
                    <label for="firstName" class="form-label">First name:</label>
                    <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                </div>

                <div class="col-sm-6">
                    <label for="lastName" class="form-label">Last name:</label>
                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
            </div>

            <div class="col-sm-6">
                <label for="dateOfBirth" class="form-label">Date of birth:</label>
                <input type="date" class="form-control" id="dateOfBirth" placeholder="" value="" required="">
            </div>

            <div class="col-sm-12">
                <form>
                    <div class="form-label">Gender:</div>
                    <input type="radio" id="gender1" placeholder="" value="" required="" name="gender">
                    <label for="gender1">Male</label>

                    <input type="radio" id="gender2" placeholder="" value="" required="" name="gender">
                    <label for="gender2">Female</label>
                </form>
            </div>
            <div class="col-sm-6">
                <label for="address" class="form-label">Address:</label>
                <input type="text" class="form-control" id="address" placeholder="" value="" required="">
            </div>


            </div>

        </div>
    <h2>Education and Job</h2>
    <hr>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <label for="education" class="form-label">Education</label>
            <select class="form-select" id="education" required="">
                <option value="">Choose...</option>
                <option>College</option>
                <option>University</option>
                <option>Masters</option>
                <option>PhD</option>
            </select>
        </div>
        <div class="col-md-12"></div>
        <div class="col-md-6">
            <label for="career" class="form-label">Career</label>
            <select class="form-select" id="career" required="">
                <option  value="1">Nghệ thuật</option>
                <option  value="2">Kinh doanh</option>
                <option  value="3">Kỹ thuật</option>
                <option  value="4">Luật pháp</option>
                <option  value="5">Y dược</option>
                <option  value="6">Giáo dục</option>
                <option  value="7">Báo chí</option>
                <option  value="8">Giải trí</option>
                <option  value="15">Truyền thông</option>
                <option  value="9">Ẩm thực</option>
                <option  value="10">Hành chính</option>
                <option  value="11">Thể thao</option>
                <option  value="12">Công an</option>
                <option  value="16">Quân đội</option>
                <option  value="17">Xây dựng</option>
                <option  value="18">Tài chính</option>
                <option  value="19">Ngân hàng</option>
                <option  value="20">CNTT</option>
                <option  value="21">Nông nghiệp</option>
                <option  value="22">Vận tải</option>
                <option  value="23">Du lịch</option>
                <option  value="14">Sinh viên</option>
                <option  value="24">Chưa đi làm</option>
                <option  value="13">Khác</option>
            </select>
        </div>
    </div>
</div>
    <br>

</div>

<br>
<button type="button" class="btn btn-primary btn-lg" style="margin-left: auto;margin-right: auto;display: block">Save</button>
<br>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>