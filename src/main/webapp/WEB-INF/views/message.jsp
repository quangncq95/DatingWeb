<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/nav3.jsp"></jsp:include>


<div class="container">
    <header class="d-flex justify-content-center py-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a href="/encounters" class="nav-link" aria-current="page">Một nửa</a></li>
            <li class="nav-item"><a href="/liked-you" class="nav-link">Liked you!</a></li>
            <li class="nav-item"><a href="/message" class="nav-link active">Message</a></li>
        </ul>
    </header>
</div>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>