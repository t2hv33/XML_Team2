<%--
    Document   : thankyou
    Created on : May 7, 2013, 8:39:03 PM
    Author     : thanhhvG
--%>
<%@page import="controller.xmlprojectContextListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="description" content="X Project" />
        <meta name="keywords" content="computer" />

        <link rel="stylesheet" type="text/css" href="css/layout.css" />
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link type="text/css" rel="stylesheet" href="css/form.css"  />
        <!-- Common CSS -->
        <link type="text/css" rel="stylesheet" href="css/global.css"  />
        <link type="text/css" rel="stylesheet" href="css/main.css"  />
        <!-- End. Common CSS -->
        <!-- JS Library -->
        <script type="text/javascript" src="js/common.js"></script>
        <script type="text/javascript" src="js/tooltips.js"></script>
        <script type="text/javascript" src="js/SearchFireFox.js"></script>
        <script type="text/javascript" src="js/sort.js"></script>
        <script type="text/javascript" src="js/detailPage.js"></script>
        <script type="text/javascript" src="js/AddProduct.js"></script>
        <script type="text/javascript" src="js/EditProduct.js"></script>
        <script type="text/javascript" src="js/ValidateProduct.js"></script>
        <script type="text/javascript" src="js/detailPage.js"></script>
        <script type="text/javascript" src="js/SearchMP.js"></script>
            <!-- start: Favicon -->
        <link rel="shortcut icon" href="images/x-p.png"/>
        <!-- end: Favicon -->

        <title>Thanks you</title>

    </head>

    <body>
        <div style="position:absolute; right:0;">
        </div>

        <div id="main">

            <!--Start:header-->
            <%@ include file="headerMP.jsp"%>
            <!--End:header-->

            <div id="content">
                <!-- breadcrumbs -->
                <div class="flash-message">
                </div>
                <div id="column-22">
                    <!--Start:Sub menu-->
                    <%@ include file="menu.jsp"%>
                    <!--End: Sub menu-->

                    <div class="SubContent02">
                        <div class="items" id="result">

                            <!--Content here-->
                            <div align="center">
                                <a href="index.jsp"><img src="images/thankyou.jpg" width="200px" height="250px" alt="thank you"/></a>                           
                            </div>


                        </div>

                    </div>
                </div>
            </div>
            <!--begin footer-->
            <div id="footer">
                <%@ include file="footer.jsp" %>
            </div>
        </div>

    </body>

</html>
