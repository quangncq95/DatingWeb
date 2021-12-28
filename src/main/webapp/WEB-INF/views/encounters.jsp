<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<%--<jsp:include page="/WEB-INF/views/common/nav3.jsp"></jsp:include>--%>
<header class="p-3 text-white" style="background-color : #ffc0cb ">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-between ">
            <a href="/home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>
            <div class="flex-shrink-0 dropdown">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="images/nhd.png" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="#">New project...</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/encounters" class="nav-link active" aria-current="page">Một nửa</a></li>
            <li class="nav-item"><a href="/liked-you" class="nav-link">Liked you!</a></li>
            <li class="nav-item"><a href="/message" class="nav-link">Message</a></li>
        </ul>
    </header>
</div>


<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>
<h1 style="text-align: center">Test</h1>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>