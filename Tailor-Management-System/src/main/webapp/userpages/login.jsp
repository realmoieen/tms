<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="AM Developers Tailor Management System">
        <meta name="author" content="Moieen Abbas">

        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <!-- App title -->
        <title>Login - Tailor Management System</title>

        <!-- App css -->
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/core.css" rel="stylesheet">    
        <link href="${contextPath}/resources/css/components.css" rel="stylesheet">      
        <link href="${contextPath}/resources/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/resources/css/responsive.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/resources/css/login.css" rel="stylesheet" type="text/css" />

    </head>

    <body class="fixed-left">

        <section id="wrapper" class="login-register">
            <!--<div class="title-box">
                <img src="${contextPath}/resources/images/lily-logo-min.png" width="80px"><p class="font-size-20 dtext">A simple Tailor Shop Management System.</p>-->
        </div>
        <div class="login-box login-sidebar">
            <div class="white-box">



                <form method="POST" action="${contextPath}/login" accept-charset="UTF-8" class="form-horizontal form-material"><input name="_token" type="hidden" value="sWCpeGhJbMOO1gXzt7wAnm00Yc14c6cfOrIJLRKq">

                    <a href="javascript:void(0)" class="text-center db">
                        <img src="${contextPath}/resources/images/tj-logo.png" alt="Home" width="100px" />
                        <h3 class=" text-left m-t-40">Login</h3>
                    </a>
                    <span role="alert" class="wpcf7-not-valid-tip ${message != null ? '' : 'hidden'}">${message}</span>
                    <div class="form-group ${error != null ? 'has-error' : ''}">
                        <div class="form-material col-xs-12">
                            <input placeholder="User Name" class="form-control" name="username" type="name" value="">
                            
                            <span class="help-block">
                                <strong>${error}</strong>
                            </span>
                        </div>
                    </div>
                    <div class="form-group ${bad_credential != null ? 'has-error' : ''}">
                        <div class="col-xs-12">
                            <input placeholder="password" class="form-control" name="password" type="password" value="">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <span class="help-block">
                                <strong>${bad_credential}</strong>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="checkbox-remember-me" type="checkbox" name="rememberMe" >
                                <label for="checkbox-remember-me"> Remember me </label>
                            </div>
                            <a href="javascript:void(0)" onclick="alert('Alert! Please contact with Developer.')" id="to-recover" class="text-dark pull-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a> 
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-warning btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Log In</button>
                        </div>
                    </div>
                                ${pageContext.request.session.removeAttribute("login_error")}
                                <%session.removeAttribute("login_error");%>
                </form>



                <footer class="page-copyright">
                    <p>BY <a class="font-w600" href="http://facebook.com/" target="_blank"> AM Developers</a></p>
                    <p>© <span>2020</span>. All RIGHT RESERVED.</p>
                </footer>

            </div>
        </div>
    </section>    

    <!-- jQuery -->
    <script src="${contextPath}/resources/js/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/detect.js"></script>
    <script src="${contextPath}/resources/js/fastclick.js"></script>
    <script src="${contextPath}/resources/js/jquery.blockUI.js"></script>
    <script src="${contextPath}/resources/js/waves.js"></script>
    <script src="${contextPath}/resources/js/jquery.scrollTo.min.js"></script>
</body>
</html>
