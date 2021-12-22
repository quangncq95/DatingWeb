<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/nav1.jsp"></jsp:include>
<form>
    <button formmethod="post" formaction="encounters">Login</button>
    <button formmethod="post" formaction="registration">Create account</button>
    <button>Forgot password?</button>
</form>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>