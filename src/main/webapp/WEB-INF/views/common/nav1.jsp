<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            </ul>
            <div class="text-end">
                <form action="/registration" method="post">
                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Sign-up</button>
                    <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Login</button>
                </form>
            </div>
        </div>
    </div>
</header>