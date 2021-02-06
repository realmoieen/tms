<%-- 
    Document   : dashboard-sidebar
    Created on : Sep 3, 2019, 12:36:25 AM
    Author     : Moieen Abbas
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="../include/navbar.jsp"/>
<!-- ========== Left Sidebar Start ========== -->
<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">

        <!--- Sidemenu -->
        <div id="sidebar-menu">  
            <ul>

                <li class="menu-title">Navigation</li>

                <li class="has_sub">
                    <a href="${contextPath}/dashboard" class="waves-effect"><i class="mdi mdi-view-dashboard"></i> <span> Dashboard </span> </a>
                </li>

                <li class="menu-title">Customer Area</li>

                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-account-multiple"></i> <span> Customer </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="${contextPath}/customers/initInsert">Add Customer</a></li>
                        <li><a href="${contextPath}/customers">Customers List</a></li>
                    </ul>
                </li>
                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-shopping"></i> <span> Order </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="${contextPath}/orders/create">Add Order</a></li>
                        <li><a href="${contextPath}/orders">Orders List</a></li>
                    </ul>
                </li>

                <li class="menu-title">Staff Area</li>

                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-account"></i> <span> Staff </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="${contextPath}/staffs/create">Add Staff</a></li>
                        <li><a href="${contextPath}/staffs">Staffs List</a></li>
                    </ul>
                </li>
                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-cash-multiple"></i> <span> Salary </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="${contextPath}/salaries/create">Add Salary</a></li>
                        <li><a href="${contextPath}/salaries">Salaries List</a></li>
                    </ul>
                </li>

                <li class="menu-title">SETTINGS AREA</li>

                <li class="has_sub">
                    <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-settings"></i> <span> Profile </span> <span class="menu-arrow"></span></a>
                    <ul class="list-unstyled">
                        <li><a href="${contextPath}/password">Change Password</a></li>
                        <li><a href="#" onclick="document.forms['logoutForm'].submit()">Logout</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- Sidebar -->

    </div>
    <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->
