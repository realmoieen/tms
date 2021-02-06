<%-- 
    Document   : index
    Created on : Mar 8, 2020, 2:35:54 PM
    Author     : Moieen Abbas
        <div class="container">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
            </c:if>
        </div>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="AM Developers - TMS">
        <meta name="author" content="Moieen Abbas">

        <!-- App favicon -->
        <link rel="shortcut icon" href="${contextPath}/resources/favicon.ico">
        <!-- App title -->
        <title>Dashboard | TJ TMS</title>

        <!-- DataTables -->
        <link href="${contextPath}/resources/css/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/resources/css/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/resources/css/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/resources/css/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link href="${contextPath}/resources/css/plugins/toast/jquery.toast.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/resources/css/plugins/select2/select2.min.css" rel="stylesheet" type="text/css"/>

        <!-- App css -->
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/core.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/components.css" rel="stylesheet">      
        <link href="${contextPath}/resources/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/resources/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath}/resources/css/responsive.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="${contextPath}/resources/js/modernizr.min.js"></script>

    </head>

    <body class="fixed-left">

        <!-- Loader 
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                  <div class="spinner-wrapper">
                    <div class="rotator">
                      <div class="inner-spin"></div>
                      <div class="inner-spin"></div>
                    </div>
                  </div>
                </div>
            </div>
        </div>-->

        <!-- Begin page -->
        <div id="wrapper">
            <jsp:include page="../include/sidebar.jsp"/>
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">


                        <script type="text/javascript" src="../resources/js/chartjs/Chart.min.js"></script>

                        <div class="row">
                            <div class="col-xs-12">
                                <div style="background: url('${contextPath}/resources/images/bg3.jpg'); margin: 0px -20px; background-position: bottom;">
                                    <div style="background-color: rgba(62, 74, 89, 0.69);">
                                        <div class="page-title-box" style="margin: 0; margin-bottom: 20px; background-color: transparent;">
                                            <div class="col-lg-12 m-t-40">
                                                <h2 class="text-white m-b-0">Dashboard</h2>
                                            </div>
                                            <div class="col-sm-6 col-md-6 col-xs-12">
                                                <p class="text-muted" style="font-size: 20px; font-weight: 800 ">Welcome ${friendlyName != null ? friendlyName : ''}</p>
                                            </div>
                                            <div class="clearfix"></div>                                  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->


                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-success">
                                    <i class="mdi mdi mdi-briefcase-check widget-two-icon"></i>
                                    <div class="wigdet-two-content text-white">
                                        <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="ORDER READY">ORDER READY</p>
                                        <h2 class="text-white"><span data-plugin="counterup">6</span></h2>
                                        <p class="m-0"><b>Total</b></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-warning">
                                    <i class="mdi mdi-briefcase-download widget-two-icon"></i>
                                    <div class="wigdet-two-content text-white">
                                        <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Statistics">ORDER CONFIRM</p>
                                        <h2 class="text-white"><span data-plugin="counterup">51</span></h2>
                                        <p class="m-0"><b>Tolal</b></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-danger">
                                    <i class="mdi mdi-square-inc-cash widget-two-icon"></i>
                                    <div class="wigdet-two-content text-white">
                                        <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Statistics">ORDER DUE</p>
                                        <h2 class="text-white"><span data-plugin="counterup">17814576</span></h2>
                                        <p class="m-0"><b>Total</b></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-info">
                                    <i class="mdi mdi-account-convert widget-two-icon"></i>
                                    <div class="wigdet-two-content text-white">
                                        <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Statistics">STAFF</p>
                                        <h2 class="text-white"><span data-plugin="counterup">8</span></h2>
                                        <p class="m-0"><b>Total</b></p>
                                    </div>
                                </div>
                            </div>                            
                        </div>


                        <div class="row">
                            <div class="col-md-5">
                                <div class="card-box">
                                    <h4 class="header-title m-t-0 ">ORDER CHART</h4>
                                    <canvas id="myChart" width="50%"></canvas>
                                    <script>
                                        new Chart(document.getElementById("myChart"), {
                                            type: 'pie',
                                            data: {
                                                labels: ["Confirm", " Processing", "Ready", "Delivered"],
                                                datasets: [{
                                                        label: "Population (millions)",
                                                        backgroundColor: ["#70b9eb", "#f3b760", "#46c37b", "#f5707a"],
                                                        data: [51, 10, 6, 7]
                                                    }]
                                            },
                                            options: {
                                                title: {
                                                    display: false,
                                                    text: 'Order Chart'
                                                }
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card-box widget-box-one">
                                            <table width="100%" class="text-center">
                                                <tr>
                                                    <td style="width: 50%;">
                                                        <div class="push-30 push-30-t">
                                                            <i class="fa fa-users fa-3x text-primary-dark"></i>
                                                        </div>
                                                    </td>
                                                    <td style="width: 50%;">
                                                        <div class="h1 font-w700"><span class="h2 text-muted">+59</span> </div>
                                                        <div class="h5 text-muted text-uppercase push-5-t"> Customers</div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Order</p>
                                                <h2 class="text-warning"><span data-plugin="counterup">8</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">    
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Ready</p>
                                                <h2 class="text-success"><span data-plugin="counterup">2</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">    
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Delivered</p>
                                                <h2 class="text-danger"><span data-plugin="counterup">0</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Amount</p>
                                                <h2 class="text-warning"><span data-plugin="counterup">$17602365</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="col-md-4">    
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Paid</p>
                                                <h2 class="text-success"><span data-plugin="counterup">$199155</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">    
                                        <div class="card-box widget-box-one">
                                            <div class="wigdet-one-content">
                                                <p class="m-0 text-uppercase font-600 font-secondary text-overflow">Due</p>
                                                <h2 class="text-danger"><span data-plugin="counterup">$17403210</span></h2>
                                                <p class="text-muted m-0"><b>CURRENT MONTH</b></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>        
                        </div>

                    </div> <!-- container -->

                </div> <!-- content -->
                <!--Start adding footer-->
                <jsp:include page="../include/footer.jsp"/>
                <!--End Footer-->
                <!-- ============================================================== -->
                <!-- End Right content here -->
                <!-- ============================================================== -->

            </div>
        </div>
        <!-- END wrapper -->

        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery -->
        <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${contextPath}/resources/js/detect.js"></script>
        <script src="${contextPath}/resources/js/fastclick.js"></script>
        <script src="${contextPath}/resources/js/jquery.blockUI.js"></script>
        <script src="${contextPath}/resources/js/waves.js"></script>
        <script src="${contextPath}/resources/js/jquery.slimscroll.js"></script>
        <script src="${contextPath}/resources/js/jquery.scrollTo.min.js"></script>

        <script src="${contextPath}/resources/js/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/js/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="${contextPath}/resources/js/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="${contextPath}/resources/js/plugins/datatables/buttons.bootstrap.min.js"></script>
        <script src="${contextPath}/resources/js/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="${contextPath}/resources/js/plugins/datatables/responsive.bootstrap.min.js"></script>

        <script src="${contextPath}/resources/js/plugins/toast/jquery.toast.js" type="text/javascript"></script>
        <script src="${contextPath}/resources/js/plugins/select2/select2.min.js" type="text/javascript"></script>

        <!-- App js -->
        <script src="${contextPath}/resources/js/jquery.core.js"></script>
        <script src="${contextPath}/resources/js/jquery.app.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#datatable').DataTable();
            });

            // Select2
            $(".select2").select2();
        </script>



    </body>
</html>

