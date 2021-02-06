<%-- 
    Document   : dashboard-navbar
    Created on : Sep 3, 2019, 12:44:52 AM
    Author     : Moieen Abbas
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- Top Bar Start -->
<div class="topbar">

    <!-- LOGO -->
    <div class="topbar-left">
        <a href="${contextPath}" class="logo">
            <span>
                <img src="${contextPath}/resources/images/logo-tj-min.png" alt=""  class="thumb-md img-rounded bg-white"> TJ Tailors
            </span>
            <i>
                <img src="${contextPath}/resources/images/logo-tj-min.png" alt="" class="thumb-md img-rounded bg-white">
            </i>
        </a>
    </div>

    <!-- Button mobile view to collapse sidebar menu -->
    <div class="navbar navbar-default" role="navigation">
        <div class="container">

            <!-- Navbar-left -->
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <button class="button-menu-mobile open-left waves-effect waves-light">
                        <i class="mdi mdi-menu"></i>
                    </button>
                </li>
            </ul>

            <!-- Right(Notification) -->
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="javascript:void(0);" class=" right-menu-item" onclick="go_full_screen()">
                        <i class=" mdi mdi-arrow-expand-all"></i>
                    </a>
                </li>

                <li class="dropdown user-box">
                    <a href="" class="dropdown-toggle waves-effect waves-light user-link" data-toggle="dropdown" aria-expanded="true">
                        <img src="${contextPath}/resources/images/user.png" alt="user-img" class="img-circle user-img">
                    </a>

                    <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                        <li class="dropdown-header">Login as</li>
                        <li>
                            <a href="${contextPath}">
                                ${userName != null ? userName : ''}
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Profile</li>
                        <li>
                            <a href="${contextPath}/password"><i class="ti-user m-r-5"></i> Change Password</a>
                        </li>
                        <li>
                            <a href="#" onclick="document.forms['logoutForm'].submit()">
                                <i class="ti-power-off m-r-5"></i> Logout 
                            </a>
                        </li>
                    </ul>
                </li>
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </ul> <!-- end navbar-right -->

        </div><!-- end container -->
    </div><!-- end navbar -->
</div>
<!-- Top Bar End -->