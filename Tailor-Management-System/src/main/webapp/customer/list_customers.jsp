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
        <meta th:name="${_csrf.parameterName}" th:content="${_csrf.token}"/>

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
        <script src="${contextPath}/resources/js/tmsconsole.js" type="text/javascript"></script>

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
                                    <h3 class="page-title">All <small> Customers</small></h3> 
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Dashboard</a>
                                        </li>
                                        <li class="active">
                                            All Customers
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
                                            Customer <small>Records</small>
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
                                            <div class="row" >
                                                <div class="table-responsive">
                                                    <table id="datatable" class="table table-striped compact">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Phone</th>
                                                                <th>CNIC</th>
                                                                <th>Address</th>
                                                            </tr>
                                                        </thead>

                                                    </table> 
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 10px;">
                                                <div class="col-sm-12" style="text-align: right">
                                                    <input class="btn btn-primary waves-primary" type="button"id="insert" value="Insert">
                                                    <input class="btn btn-info" type="button" id="edit" value="Edit">
                                                    <input class="btn btn-danger waves-danger" id="delete" type="button" value="Delete">
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

        <jsp:include page="../include/alerts.jsp"/>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#datatable').DataTable({
                    "serverSide": true,
                    rowId: 'customerId',
                    "pagingType": "full",
//                    "sDom": '<"top"<"actions">lfpi<"clear">><"clear">rt<"bottom">',
                    "columns": [// NOTE: you need to specify names of fields as ids for the columns
                        {
                            data: "customerId",
                            searchable: false,
                            orderable: false,
                            className: "center",
                            "render": function (data, type, row, meta) {
                                return '<div class="radio radio-info radio-inline"><input id="customerId' + data + '" name="customerId" type="radio" value="' + data + '"><label style="text-decoration:underline;padding-left: 5px;" for="customerId' + data + '">' + data + ' </label></div>';
//                                return '<a href="'+data+'">Download</a>';
                            }
//                            defaultContent: '<a href="#" class="btn btn-sm btn-success"><i class="fa fa-eye"></i></a>---<a href="#" class="btn btn-sm btn-warning"><i class="fa fa-edit"></i></a>'
                        },
                        {data: "customerName"},
                        {data: "phoneNo"},
                        {data: "cnic"},
                        {data: "address"}
                    ],
                    "ajax": {
                        "url": "/tms/customers/data",
                        "type": "POST",
                        "contentType": "application/json",
                        "data": function (d) {
                            console.log(JSON.stringify(d));
                            return JSON.stringify(d); // NOTE: you also need to stringify POST payload
                        }
                    }
                });
            });

//Edit Button
            $("input[type='button'][id='edit']").click(function () {
                var radioValue = $("input[name='customerId']:checked").val();
                console.log(radioValue);
                if (radioValue=='undefined' || radioValue==null || radioValue=="") {
                    alert("Select a record to edit");
                    return;
                }
                    window.location='/tms/customers/initUpdate?customerId='+radioValue;
            });
//Delete Button
            $("input[type='button'][id='delete']").click(function () {
                var radioValue = $("input[name='customerId']:checked").val();
                console.log(radioValue);
                if (radioValue=='undefined' || radioValue==null || radioValue=="") {
                    alert("Select a record to delete");
                    return;
                }
                    alert("you selected "+radioValue);
            });
// Select2
//            $(".select2").select2();
        </script>


    </body>
</html>

