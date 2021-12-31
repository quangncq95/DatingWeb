<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header class="p-3 text-white" style="background-color : #ffc0cb ">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-between ">
            <a href="/encounters" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="/images/mabel1.png" width="80px">
            </a>
            <div class="flex-shrink-0 dropdown">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/images/${currentUser.idanh}" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                    <li><a class="dropdown-item" href="/change_pass">Change Password</a></li>
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