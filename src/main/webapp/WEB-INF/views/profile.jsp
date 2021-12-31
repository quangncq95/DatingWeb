<%@page pageEncoding="utf-8" contentType="text/html; ISO-8859-1 " language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
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


<div class="wrapper bg-white mt-sm-5">
    <h4 class="pb-4 border-bottom">Account settings</h4>
    <div class="d-flex align-items-start py-3 border-bottom"><img
            src="https://images.pexels.com/photos/1037995/pexels-photo-1037995.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
            class="img" alt="">
        <div class="pl-sm-4 pl-2" id="img-section"><b>Profile Photo</b>
            <p>Accepted file type .png. Less than 1MB</p>
            <button class="btn button border"><b>Upload</b></button>
        </div>
    </div>
    <div class="py-2">
        <div class="row py-2">
            <div class="col-md-6"><label>First Name</label> <input type="text" class="bg-light form-control"
                                                                   placeholder="Steve"></div>
            <div class="col-md-6 pt-md-0 pt-3"><label>Last Name</label> <input type="text" class="bg-light form-control"
                                                                               placeholder="Smith"></div>
        </div>
        <div class="row py-2">
            <div class="col-md-6"><label>Email Address</label> <input type="text" class="bg-light form-control"
                                                                      placeholder="steve_@email.com"></div>
            <div class="col-md-6 pt-md-0 pt-3"><label>Phone Number</label> <input type="tel"
                                                                                  class="bg-light form-control"
                                                                                  placeholder="+1 213-548-6015"></div>
        </div>
        <div class="row py-2">
            <div class="col-md-6"><label for="country">Country</label> <select name="country" id="country"
                                                                               class="bg-light">
                <option value="india" selected>India</option>
                <option value="usa">USA</option>
                <option value="uk">UK</option>
                <option value="uae">UAE</option>
            </select></div>
            <div class="col-md-6 pt-md-0 pt-3" id="lang"><label for="language">Language</label>
                <div class="arrow"><select name="language" id="language" class="bg-light">
                    <option value="english" selected>English</option>
                    <option value="english_us">English (United States)</option>
                    <option value="enguk">English UK</option>
                    <option value="arab">Arabic</option>
                </select></div>
            </div>
        </div>
        <div class="py-3 pb-4 border-bottom">
            <form>
                <button formmethod="post" formaction="encounters" class="btn btn-primary mr-3">Save Changes</button>
                <button class="btn border button">Cancel</button>
            </form>
        </div>
        <div class="d-sm-flex align-items-center pt-3" id="deactivate">
            <div><b>Deactivate your account</b>
                <p>Details about your company account and password</p>
            </div>
            <div class="ml-auto">
                <button class="btn danger">Deactivate</button>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>