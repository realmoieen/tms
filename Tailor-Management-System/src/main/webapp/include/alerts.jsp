<%-- 
    Document   : footer
    Created on : Sep 3, 2019, 1:00:07 AM
    Author     : Moieen Abbas
--%>

<%@page import="com.amdevelopers.tms.alerts.UserAlerts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute(UserAlerts.NOTICE) != null && session.getAttribute(UserAlerts.NOTICE) != "") {%>

<script type="text/javascript">
    $(document).ready(function () {
        $.toast({
            heading: 'Success'
            , text: '<%=session.getAttribute(UserAlerts.NOTICE)%>'
            , position: 'mid-center'
            , loaderBg: '#ff6849'
            , icon: 'success'
            , hideAfter: 9500
            , stack: 6
        })
    });
</script>
<%session.removeAttribute(UserAlerts.NOTICE);
    }%>

<%if (session.getAttribute(UserAlerts.ERROR) != null && session.getAttribute(UserAlerts.ERROR) != "") {%>
<script type="text/javascript">
    $(document).ready(function () {
        $.toast({
            heading: 'Error'
            , text: '<%=session.getAttribute(UserAlerts.ERROR)%>'
            , position: 'mid-center'
            , loaderBg: '#ff6849'
            , icon: 'error'
            , hideAfter: 9500
            , stack: 6
        })
    });
</script>
<%session.removeAttribute(UserAlerts.ERROR);
    }%>
    
    