<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="truelove.png" >
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/home" class="nav-link px-2 text-white" style="font-family: 'Baskerville Old Face';margin-left: 500px;">TRUE LOVE</a></li>
            </ul>
            <div class="text-end">
                <form action="/registration" method="post">
                    <button type="submit"  class="btn btn-warning">Sign-up</button>
                </form>
            </div>
        </div>
    </div>
</header>