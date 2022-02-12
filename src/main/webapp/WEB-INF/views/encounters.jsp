<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <%--    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>--%>
    <%--    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.css">--%>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <%--    <script src="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>

    </style>
    <style>
        #container {
            width: 545px;
            height: 720px;
            position: relative;
            margin: auto;

            list-style-type: none;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }


        .buddy {
            width: 545px;
            height: 720px;
            padding: 20px;
            display: block;
            position: absolute;
            top: 0px;
            left: 0px;

            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            color: #fff;
            cursor: hand;
        }

        #information-container {

        }

        .rotate-left {
            transform: rotate(30deg) scale(0.8);
            transition: 2s;
            margin-left: 400px;
            cursor: e-resize;
            opacity: 0;
            z-index: 10;
        }

        .rotate-right {
            transform: rotate(-30deg) scale(0.8);
            transition: 2s;
            opacity: 0;
            margin-left: -400px;
            cursor: w-resize;
            z-index: 10;
        }

        .avatar {
            width: 505px;
            height: 680px;
        }

        .like {
            border-radius: 5px;
            padding: 5px 10px;
            border: 2px solid green;
            color: green;
            text-transform: uppercase;
            font-size: 25px;
            position: absolute;
            top: 50px;
            right: 40px;
            text-shadow: none;
        }

        .dislike {
            border-radius: 5px;
            padding: 5px 10px;
            border: 2px solid red;
            color: red;
            text-transform: uppercase;
            font-size: 25px;
            position: absolute;
            top: 50px;
            left: 40px;
            text-shadow: none;
        }

        .btn-like {
            width: 80px;
            height: 80px;
            position: absolute;
            right: 0;
            top: 0;

            background-color: transparent;
            border: solid 2px green;
            border-radius: 50%;
            color: green;
            font-size: 30px;
            vertical-align: middle;
        }

        .btn-like:hover {
            font-size: 40px;
        }

        .btn-dislike {
            width: 80px;
            height: 80px;
            position: absolute;
            left: 0;
            top: 0;

            background-color: transparent;
            border: solid 2px red;
            border-radius: 50%;
            color: red;
            font-size: 30px;
            vertical-align: middle;
        }

        .btn-dislike:hover {
            font-size: 40px;
        }

        .like-dislike-btn {
            width: 60%;
            position: absolute;
            top: 80%;
            left: 50%;
            transform: translateX(-50%);
        }

    </style>
    <link rel="stylesheet" href="/style/background_home.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/encounters" class="nav-link active" aria-current="page">Một nửa</a></li>
            <li class="nav-item"><a href="/liked-you" class="nav-link">Liked you!</a></li>
            <li class="nav-item"><a href="/message" class="nav-link">Message</a></li>
        </ul>
    </header>
</div>


<div id="container">
    <div class="buddy" style="display: block;">
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="avatar" src="/images/test/avatar_1.jpg" alt="Los Angeles" class="d-block"
                         style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="avatar" src="/images/test/avatar_2.jpg" alt="Chicago" class="d-block"
                         style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="avatar" src="/images/test/avatar_3.jpg" alt="New York" class="d-block"
                         style="width:100%">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
        <div class="like-dislike-btn">
            <button class="btn-like" type="button"><i class="fa fa-heart"></i></button>
            <button class="btn-dislike" type="button"><i class="fa fa-remove"></i></button>
        </div>
<%--        <div class="like-dislike-btn">--%>
<%--            <form>--%>
<%--                <input type="text" name="id_liked" value="64" hidden>--%>
<%--                <input type="text" name="id_account" hidden--%>
<%--                       value="<sec:authentication property="principal.id_account"></sec:authentication>">--%>
<%--                <button class="btn-like" type="submit" formaction="/save-interested" formmethod="post"><i--%>
<%--                        class="fa fa-heart"></i></button>--%>
<%--                <button class="btn-dislike" type="button"><i class="fa fa-remove"></i></button>--%>
<%--            </form>--%>
<%--        </div>--%>

    </div>

    <div class="buddy" style="display: block;">
        <!-- Carousel -->
        <div id="demo1" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo1" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo1" data-bs-slide-to="1"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="avatar" src="/images/test/avatar_5.jpg" alt="Chicago" class="d-block"
                         style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="avatar" src="/images/test/avatar_6.jpg" alt="New York" class="d-block"
                         style="width:100%">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo1" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo1" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <div class="like-dislike-btn">
            <button class="btn-like" type="button"><i class="fa fa-heart"></i></button>
            <button class="btn-dislike" type="button"><i class="fa fa-remove"></i></button>
        </div>
    </div>

    <div class="buddy" style="display: block;">
        <!-- Carousel -->
        <div id="demo2" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo2" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo2" data-bs-slide-to="1"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="avatar" src="/images/test/avatar_7.jpg" alt="Chicago" class="d-block"
                         style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="avatar" src="/images/test/avatar_8.jpg" alt="New York" class="d-block"
                         style="width:100%">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo2" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo2" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <div class="like-dislike-btn">
            <button class="btn-like" type="button"><i class="fa fa-heart"></i></button>
            <button class="btn-dislike" type="button"><i class="fa fa-remove"></i></button>
        </div>
    </div>


</div>

<div id="information-container">

</div>

<script>
    $(document).ready(function () {

        //Download and create HTML


        //Display first card and hide other card
        $('.buddy').hide()
        $('.buddy').first().show();


        // var callback = createCard;
        //     requestNewCard(callback);
        $(".btn-like").click(function () {

            $(this).parent().parent().addClass('rotate-left').delay(700).fadeOut(1);
            $('.buddy').find('.status').remove();
            $(this).parent().parent().append('<div class=" like">Like!</div>');
            //Send infor Like to server

            if ($(this).parent().parent().is(':last-child')) {
                // alert("Need request new card")
            } else {
                $(this).parent().parent().next().removeClass('rotate-left rotate-right').fadeIn(400);
            }


        });

        $(".btn-dislike").on("click", function () {
            $(this).parent().parent().addClass('rotate-right').delay(700).fadeOut(1);
            $('.buddy').find('.status').remove();
            $(this).parent().parent().append('<div class="status dislike">DisLike!</div>');
            if ($(this).parent().parent().is(':last-child')) {
                // alert("Need request new card")
            } else {
                $(this).parent().parent().next().removeClass('rotate-left rotate-right').fadeIn(400);
            }
        });


        function requestNewCard(CallBack) {
            $.ajax({
                    method: "GET",
                    url: "/test/test.json",
                    dataType: "json",
                    success: CallBack,
                }
            )
        }

        function handleInformation(json) {
            if (json.peoples.length > 0) {
                for (var i = 0; i < json.peoples.length; ++i) {
                    if (json.peoples[i].imagePath.length > 0) {
                        for (var j = 0; j < json.peoples[i].imagePath.length; ++j) {
                            displayImage(i, json.peoples[i]);
                        }
                    }
                }

            }
        }

        function displayImage(json) {
            alert(json.peoples[0].firstName);
        }


    });
</script>
</body>
</html>