<%--
    Document   : index
    Created on : Apr 23, 2013, 7:14:35 PM
    Author     : duy
--%>

<%@page import="controller.xmlprojectContextListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String path = application.getRealPath("/");
            String fileName = path + "xml/Duy.xml";
            xmlprojectContextListener.prepareProductXML(fileName);
%>
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
            <!-- start: Favicon -->
        <link rel="shortcut icon" href="images/x-p.png"/>
        <!-- end: Favicon -->
        <title>Login to X-SHOP</title>
        <style type="text/css">
            .loginform-content{
                display:table;
                width: 330px;
                padding: 10px;
                background: #F1F1F1;
                -webkit-border-radius:4px;
                -moz-border-radius:4px;
                border: 3px solid #1a7fc3;
                margin: 5px auto;
            }
            .login_title
            {
                color: #1a7fc3;
                font-size: 20pt;
                margin-bottom: 20px;
                font-weight: bold;
                margin-left: 115px
            }
            .login_table
            {
                font-size: 10pt;
                margin-top: 0px;
                margin-bottom: 5px;
                background-color: #F1F1F1;
            }
            .logbutton{
                width: 60px;
                height: 30px;

                border: 1px solid #1a7fc3;
                color: #1a7fc3;
                font-weight: bold;
                font-size: 15px;
            }

        </style>
    </head>

    <body>
        <div style="position:absolute; right:0;">
        </div>

        <div id="main">
            <!--Start:header-->
            <%@ include file="header.jsp"%>
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

                        <div id="result">

                            <div class="loginform-content" >
                                <div id="login_box">
                                    <form action="AccountController" method="POST">
                                        <div class="login_title">
                                            Login</div>
                                        <table bgcolor="#ffffff" border="0" cellpadding="3" cellspacing="0" width="100%" class="login_table">
                                            <tbody>
                                                <tr>
                                                    <td align="right" valign="middle" width="300px">
                                                        <span id="lblUserName" class="fontregular" style="color: #1a7fc3; font-weight: bold;">Username: </span>
                                                    </td>
                                                    <td align="right" valign="middle" width="6">
                                                        &nbsp;
                                                    </td>
                                                    <td width="261" valign="middle">
                                                        <input type="text" class="textbox enterToLogin" focus="true" id="txtUserName" name="txtUsername" style="width: 200px;
                                                               height: 20px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle">
                                                        <span id="lblPassword" class="fontregular" style="color: #1a7fc3; font-weight: bold;">Password: </span>
                                                    </td>
                                                    <td align="right" valign="middle">
                                                        &nbsp;
                                                    </td>
                                                    <td valign="middle">
                                                        <input type="password" class="textbox enterToLogin" id="txtPassWord" name="txtPassword" style="width: 200px;
                                                               height: 20px;">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle">
                                                        &nbsp;
                                                    </td>
                                                    <td align="right" valign="middle">
                                                        &nbsp;
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                                        <div id="inva" style="font-size: medium">${requestScope.error}</div>
                                        <div>
                                            <center>

                                                <div id="btnFNRM">
                                                    <input class="logbutton" type="submit" name="action" value="Login"/>&nbsp;&nbsp;&nbsp;
                                                    <input class="logbutton" type="reset" name="action" value="Reset"/>
                                                </div>
                                            </center>
                                        </div>

                                    </form>
                                </div>
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