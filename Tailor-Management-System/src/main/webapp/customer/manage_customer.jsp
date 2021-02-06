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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <script src="../resources/js/tmsconsole.js" type="text/javascript"></script>

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

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="page-title-box">
                                    <h3 class="page-title">Add Customer <small> Add New Customer Data.</small></h3> 
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Dashboard</a>
                                        </li>
                                        <li class="active">
                                            Add Customer
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- /row -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="portlet">
                                    <div class="portlet-heading portlet-default">
                                        <h3 class="portlet-title text-dark">
                                            Customer Form <small>Requierd</small>
                                        </h3>
                                        <div class="portlet-widgets">                                            
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#bg-default"><i class="ion-minus-round"></i></a>
                                            <span class="divider"></span>
                                            <a href="#" class="zoom"><i class="ion-arrow-resize"></i></a>
                                            <span class="divider"></span>
                                            <a href="#" data-toggle="remove"><i class="ion-close-round"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div id="bg-default" class="panel-collapse collapse in">
                                        <div class="portlet-body">                           
                                            <div class='row'>
                                                <div class="col-md-11 col-md-offset-1" style="margin-left:3.33%"> 
                                                    <form:form method="POST" action="${contextPath}/customers/${method}" modelAttribute="customerForm" accept-charset="UTF-8" class="form-horizontal m-b-30">
                                                        <div class="col-md-3">
                                                            <fieldset class="">
                                                                <legend><small>Customer Detail</small></legend>
                                                                <div class="row">
                                                                    <spring:bind path="customerId">
                                                                        <div style="display: none;">
                                                                            <form:hidden path="customerId"/>
                                                                        </div>
                                                                    </spring:bind>
                                                                    <spring:bind path="customerName">
                                                                        <div class="form-group ${!status.error ? '' : 'has-error'}">
                                                                            <label class="col-md-12">Name<span style="color: red">*</span></label>
                                                                            <div class="col-md-12">
                                                                                <!--required="required"-->
                                                                                <form:input class="form-control" placeholder="Enter Name" path="customerName" type="text" value=""/>
                                                                                <span style="color: red;">
                                                                                    <strong><form:errors path="customerName"></form:errors></strong>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                    </spring:bind>
                                                                </div>
                                                                <div class="row">
                                                                    <spring:bind path="cnic">
                                                                        <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                            <label class="col-md-12">CNIC</label>
                                                                            <div class="col-md-12">
                                                                                <form:input class="form-control" placeholder="Enter CNIC Name" path="cnic" type="text" value=""/>
                                                                                <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                    <strong><form:errors path="cnic"></form:errors></strong>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                    </spring:bind>
                                                                </div>
                                                                <div class="row">
                                                                    <spring:bind path="phoneNo">
                                                                        <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                            <label class="col-md-12">Phone Number</label>
                                                                            <div class="col-md-12">
                                                                                <form:input class="form-control" placeholder="Enter Phone Number" path="phoneNo" type="text" value=""/>
                                                                                <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                    <strong><form:errors path="phoneNo"></form:errors></strong>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                    </spring:bind>
                                                                </div>
                                                                <div class="row">
                                                                    <spring:bind path="address">
                                                                        <div class="form-group">
                                                                            <label class="col-md-12">Address</label>
                                                                            <div class="col-md-12">
                                                                                <form:textarea class="form-control" placeholder="Enter Address" path="address" type="text" value="" cols="50"/>
                                                                            </div>
                                                                        </div>
                                                                    </spring:bind>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <!--<br>-->
                                                        <!--<vr class="style-1">-->
                                                        <div class="col-md-8 col-md-offset-0" style="margin-left:3.33%">
                                                            <fieldset class="">
                                                                <legend>
                                                                    <small>Measurement Detail</small>
                                                                </legend>
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="lambai">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Length</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Length" path="lambai" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="lambai"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="asteen">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Asteen</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Asteen" path="asteen" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="asteen"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="teera">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Teera</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Teera" path="teera" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="teera"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="chest">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Chest</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Chest" path="chest" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="chest"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="collerOrBanSize">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Coller/Ban Size</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Coller/Ban Size" path="collerOrBanSize" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="collerOrBanSize"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="khulla">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Khulla</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Khulla" path="khulla" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="khulla"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="shalwar">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Shalwar</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Shalwar" path="shalwar" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="shalwar"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="panja">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Panja</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Panja" path="panja" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="panja"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="daman">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Daman</label>
                                                                                <div class="col-md-12">
                                                                                    <form:select path="daman" class="form-control" placeholder="Daman">
                                                                                        <form:options items="${list_daman}"/>
                                                                                    </form:select>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="daman"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="collerOrBan">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Coller / Ban</label>
                                                                                <div class="col-md-12">
                                                                                    <form:select class="form-control" placeholder="Coller/Ban" path="collerOrBan">
                                                                                        <form:options items="${list_neckStyles}"/>
                                                                                    </form:select>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="collerOrBan"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="collerOrBanWidth">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Coller/Ban Width</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Coller/Ban Width" path="collerOrBanWidth" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="collerOrBanWidth"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="frontPati">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Front Pati</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="Front Pati" path="frontPati" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="frontPati"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <spring:bind path="kaaf">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">Kaaf</label>
                                                                                <div class="col-md-12">
                                                                                    <form:input class="form-control" placeholder="kaaf" path="kaaf" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="kaaf"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <label class="col-md-12">Front Pocket</label>
                                                                            <div class="col-md-2">
                                                                                <spring:bind path="frontPocket">
                                                                                    <div class="checkbox checkbox-primary">
                                                                                        <form:checkbox label="" id="frontPocket" name="frontPocket" path="frontPocket" onclick="enableDisableFields(this, document.getElementById('frontPocketSize'));"></form:checkbox>
                                                                                        </div>
                                                                                </spring:bind>
                                                                            </div>
                                                                            <spring:bind path="frontPocketSize">
                                                                                <div class="col-md-10">
                                                                                    <form:input class="form-control" placeholder="Front Pocket" path="frontPocketSize" type="number" min="0" step="0.25" value="" onkeypress="return isNumberKey(this, event);"/>
                                                                                </div>
                                                                            </spring:bind>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-3">
                                                                        <spring:bind path="sidePocket">
                                                                            <div class="form-group ${status.error!=null ? '' : 'has-error'}">
                                                                                <label class="col-md-12">No. of Side Pockets</label>
                                                                                <div class="col-md-12">
                                                                                    <form:select path="sidePocket" class="form-control" >
                                                                                        <form:option label="0" value="0"/>
                                                                                        <form:option label="1" value="1"/>
                                                                                        <form:option label="2" value="2"/>
                                                                                    </form:select>
                                                                                    <span class="${status.error!=null ? '' : 'hidden'}">
                                                                                        <strong><form:errors path="sidePocket"></form:errors></strong>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                        </spring:bind>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <div class="form-group">
                                                                            <label class="col-md-12">Shalwar Pocket</label>
                                                                            <div class="col-md-12">
                                                                                <spring:bind path="shalwarPocket">
                                                                                    <div class="checkbox checkbox-primary">
                                                                                        <form:checkbox label="Shalwar Pocket" id="shalwarPocket" name="shalwarPocket" path="shalwarPocket" ></form:checkbox>
                                                                                        </div>
                                                                                </spring:bind>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12" style="text-align: right">
                                                                <input class="btn btn-primary waves-light" type="submit" value="${method=='insert' ? 'Insert' : 'Update'}">									                
                                                                <input class="btn btn-danger waves-light" type="button" onclick="window.location = '/tms/customers';" value="Cancle">									                
                                                                <input class="btn btn-info waves-light" type="reset" value="Reset">									                
                                                            </div>
                                                        </div>
                                                    </form:form>									            
                                                </div>
                                            </div>
                                        </div>  
                                    </div>        
                                </div>
                            </div>
                        </div>            
                        <!-- /row -->
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
//                $('#datatable').DataTable();
                enableDisableFields(document.getElementById('frontPocket'), document.getElementById('frontPocketSize'));
            });

            // Select2
            $(".select2").select2();
        </script>
        <jsp:include page="../include/alerts.jsp"/>
    </body>
</html>

