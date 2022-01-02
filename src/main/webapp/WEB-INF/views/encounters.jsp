<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.css">
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>
    <style>
        #container {
            width: 545px;
            margin: auto !important;
            display: block;
            height: 720px;
            position: relative;
            list-style-type: none;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .buddy {
            display: block;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            color: #fff;
            padding: 20px;
            width: 545px;
            height: 720px;
            top: 0px;
            left: 0px;
            position: absolute;
            cursor: hand;
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
            background: #222;
            width: 505px;
            height: 680px;
            display: block;
            /*margin-top: 10px;*/
            /*margin-left: 10px;*/
            background-size: auto 160% !important;
            background-position: center;
            background-repeat: no-repeat;
            position: absolute;
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

        .avatar_indicator{
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
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
        <div class="avatar_indicator">
        1/4
        </div>
        <div class="container_slides">
            <div class="avatar" style="background-image:url(/images/test/avatar_1.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_2.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_3.jpg)">

            </div>
            <div class="avatar" style="background-image:url(http://w1nd.cc/promo/347.jpg)">

            </div>
        </div>
    </div>

    <div class="buddy" style="display: block;">
        <div class="avatar_indicator">
            1/4
        </div>
        <div class="container_slides">
            <div class="avatar" style="background-image:url(http://w1nd.cc/promo/347.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_2.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_3.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_4.jpg)">

            </div>
        </div>
    </div>

    <div class="buddy" style="display: block;">
        <div class="avatar_indicator">
            1/4
        </div>
        <div class="container_slides">
            <div class="avatar" style="background-image:url(http://static.stylemagazin.hu/medias/29280/Nem-ehezik-a-Women-of-the-Year-legjobb-modell-dijara-eselyes-szepseg_32fc7c86954a8847610499a0fc7261e2.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_2.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_3.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_4.jpg)">

            </div>
        </div>
    </div>

    <div class="buddy" style="display: block;">
        <div class="avatar_indicator">
            1/4
        </div>
        <div class="container_slides">
            <div class="avatar" style="background-image:url(/images/test/avatar_1.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_2.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_3.jpg)">

            </div>
            <div class="avatar" style="background-image:url(/images/test/avatar_4.jpg)">

            </div>
        </div>
    </div>
    <a class="prev">&#8249;</a>
    <a class="next">&#8250;</a>
</div>

<script>
    $(document).ready(function(){

        $(".buddy").on("swiperight",function(){
            $(this).addClass('rotate-left').delay(700).fadeOut(1);
            $('.buddy').find('.status').remove();
            $(this).append('<div class="status like">Like!</div>');
            if ( $(this).is(':last-child') ) {
                $('.buddy:nth-child(1)').removeClass ('rotate-left rotate-right').fadeIn(300);
            } else {
                $(this).next().removeClass('rotate-left rotate-right').fadeIn(400);
            }
        });

        $(".buddy").on("swipeleft",function(){
            $(this).addClass('rotate-right').delay(700).fadeOut(1);
            $('.buddy').find('.status').remove();
            $(this).append('<div class="status dislike">Dislike!</div>');

            if ( $(this).is(':last-child') ) {
                $('.buddy:nth-child(1)').removeClass ('rotate-left rotate-right').fadeIn(300);
                alert('OUPS');
            } else {
                $(this).next().removeClass('rotate-left rotate-right').fadeIn(400);
            }
        });
    });
</script>
</body>
</html>