<%-- 
    Document   : header
    Created on : May 5, 2013, 8:29:09 AM
    Author     : thanhhvG
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<div id="header">
    <div class="header-banner">
        <div id="searchBox">
            <form class="form" name="myForm" action="">
                <div class="form">
                    <span>Search:</span>
                    <input size="20" class="InputButton" value="" name="txtSearch" id="SearchProductsForm_name" type="text" onclick="this.value = '';" />    <input class="SubmitBtn" type="button" name="yt0" value="" onclick="SearchDOMNode('xml/Duy.xml','xsl/product.xsl')" />    </div>
            </form>
        </div>
    </div>
    <div class="FuncBox">
        <ul id="menu" class="sf-js-enabled sf-shadow">
            <li class="Active current sfHover sf-breadcrumb"><a class="UnknownWidthBtn" href="index.jsp" title="Trang chủ"><span>Home</span></a></li>
            <li><a class="UnknownWidthBtn" href="#" title="Giới thiệu"><span>About Us</span></a></li>
            <li><a class="UnknownWidthBtn" href="#" title="Liên hệ"><span>Contact</span></a></li>
            <c:if test="${sessionScope.account.role =='Admin'}">
                <li><a class="UnknownWidthBtn" href="AddProduct.jsp"><span>AddProduct</span></a></li>
                <li><a class="UnknownWidthBtn" href="ManageProduct.jsp"><span>Manage Product</span></a></li>
            </c:if>
            <c:if test="${empty sessionScope.account}">
                <li class="LoginBannerGuest">
                    <div class="contentWelcome">Welcome <span style="color: blue;">Guest</span> ,
                        <a href="LoginPage.jsp" class="linkpage">Login</a>
                        <a href="register.jsp" class="linkpage">Register</a></div>
                </li>
            </c:if>
            <c:if test="${not empty sessionScope.account}">
                <li class="LoginBanner">
                    <div class="contentWelcome">Welcome <a style="color: black"><span>${sessionScope.account.username}</span></a>,<a href="AccountController?action=Logout">&nbsp;&nbsp;<font color="red">LOGOUT</font></a></div>
                </li>
                <span style="padding-left: 50px;padding-bottom:15px;">
                    <a href="viewcart.jsp" target="">
                        <img src="images/shopcart.png" border="2" width="30px" height="30px" alt=""  />
                    </a>
                    <a href="viewcart" style="padding-bottom:17px;"></a>
                </span> 
            </c:if>
        </ul>
    </div>
    <br>
    <br>

</div> 