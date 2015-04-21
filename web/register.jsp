<%--
    Document   : index
    Created on : Apr 23, 2013, 7:14:35 PM
    Author     : thanhhvG
--%>

<%@page import="controller.xmlprojectContextListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String path = application.getRealPath("/");
            String fileName = path + "xml/accounts.xml";
            xmlprojectContextListener.prepareUser(fileName);
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
        <script type="text/javascript" src="js/login.js"></script>
        <!-- start: Favicon -->
        <link rel="shortcut icon" href="images/x-p.png"/>
        <!-- end: Favicon -->
        <title>X Project</title>
        <style type="text/css">
            #reg {
                background-color: #F1F1F1;
                clear: both;
                overflow: hidden;
                padding: 30px 5px 15px 30px;                
                width: 380px;
                margin: 0px auto;
                border: 3px solid #1a7fc3;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
            }
            .editor-label {
                font-size: 12px;
                font-style: normal;
                font-weight: bold;
                color: #1a7fc3;
                margin-bottom: 5px;
            }
            .register_title {
                color: #586980;
                font-size: 26pt;
                margin-bottom: 20px;
                font-weight: bold;
                margin-left: 135px;
            }

        </style>

        <!-- Script validation -->
        <script language="JavaScript">
            var xmlHttp;
            function onSubmit() {
                password = document.getElementById("Password").value;
                repassword = document.getElementById("RetypePassword").value;
                username = document.getElementById("Username").value;
                fullname = document.getElementById("Fullname").value;
                address = document.getElementById("Address").value;
                email = document.getElementById("Email").value;
                phone = document.getElementById("Phone").value;
                valid = true;
                if (username == ""){
                    valid = false;
                    document.getElementById("errUserName").innerHTML = "Please input username!";
                    document.getElementById("errUserName").style.cssText = 'display:block';

                }else if (!checkUsername()){
                    valid = false;
                }
                if (password == "" ){
                    valid = false;
                    document.getElementById("errPassword").innerHTML = "Please input password!";
                    document.getElementById("errPassword").style.cssText = 'display:block';

                }
                else if(!checkPassword()){
                    valid = false;
                }
                if (fullname == ""){
                    valid = false;
                    document.getElementById("errFullname").style.cssText = 'display:block';
                    document.getElementById("errFullname").innerHTML = "Please input Fullname! ";
                }
                else if (!checkFullname()){
                    valid = false;
                }
                if (address == ""){
                    valid = false;
                    document.getElementById("errAddress").style.cssText = 'display:block';
                    document.getElementById("errAddress").innerHTML = "Please input address!";
                }
                else if (!checkAddress()){
                    valid = false;
                }
                if (email == ""){
                    valid = false;
                    document.getElementById("errEmail").style.cssText = 'display:block';
                    document.getElementById("errEmail").innerHTML = "Please input email!";
                }
                else if (!checkEmail()){
                    valid = false;
                }
                if (phone == ""){
                    valid = false;
                    document.getElementById("errPhone").style.cssText = 'display:block';
                    document.getElementById("errPhone").innerHTML = "Please input phone number!";
                }
                else if (!checkPhone()){
                    valid = false;
                }
                // check repassword
                else if (password != repassword){
                    document.getElementById("errRePassword").style.cssText = 'display:block';
                    document.getElementById("errRePassword").innerHTML = "Password not match";
                    valid = false;
                } else {document.getElementById("errRePassword").style.cssText = 'display:none';}

                return valid;
            }
         
            function isExisted(){
                var xmlfile="xml/accounts.xml";
                document.getElementById('regisName').style.cssText= 'display:none';
                new_xmlDOM = null;//Su dung DOM Parse cua chrome ho tro
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    //alert("FF1");
                    var xmlhttp = new XMLHttpRequest();//XML DOcument object
                }
                else
                {// code for IE6, IE5
                    //alert("IE1");
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.open("GET",xmlfile,false);
                xmlhttp.send();
                var xmlDOM = xmlhttp.responseXML;
               //alert(xmlDOM);
                searchAccNode(xmlDOM, document.Register.txtUsername.value);               

            }
            function searchAccNode (node, strSearch) {
                //alert('heheheh');
                strSearch = strSearch.toLowerCase();
                if (node == null) {
                    return;
                }

                if (node.tagName == "Name") {

                    var tmp = node.firstChild.nodeValue.toLowerCase();
                    //alert(tmp);
                    if (strSearch.localeCompare(tmp) == 0) {
                        document.getElementById('regisName').style.cssText= 'display:block';
                        document.getElementById('regisName').innerHTML = "Username is existed, please choose another name!!!";
                      
                    }
                }
                var childs = node.childNodes;
                for (var i = 0; i < childs.length; i++){
                    searchAccNode(childs[i], strSearch);
                }
            }
            function isExistedEmail(){
                // alert("HAHA");
                var xmlfile="xml/accounts.xml";
                document.getElementById('regisMail').style.cssText= 'display:none';
                new_xmlDOM = null;//Su dung DOM Parse cua chrome ho tro
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    //alert("FF1");
                    var xmlhttp = new XMLHttpRequest();//XML DOcument object
                }
                else
                {// code for IE6, IE5
                    //alert("IE1");
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.open("GET",xmlfile,false);
                //alert(xmlfile);
                xmlhttp.send();
                var xmlDOM = xmlhttp.responseXML;    
                searchMailNode(xmlDOM, document.Register.txtMail.value);
              
            }
            function searchMailNode(node, strSearch1){
                
                strSearch1=strSearch1.toLowerCase();
               
                if (node == null) {
                    return;
                }
                if (node.tagName == "Mail") {
                    var tmp = node.firstChild.nodeValue.toLowerCase();
                    //alert(tmp);
                    if (strSearch1.localeCompare(tmp) == 0) {
                        document.getElementById('regisMail').style.cssText= 'display:block';
                        document.getElementById('regisMail').innerHTML = "Email is existed, please choose another email!!!";
                    }
                }
                var childs = node.childNodes;
                for (var i = 0; i < childs.length; i++){
                    searchMailNode(childs[i], strSearch1);
                }

                
                
            }
            function isSamePass(){
                var isValid = false;
                if(document.Register.txtPassword.value == "" || document.Register.txtRetypePassword.value == ""){
                    return isValid;
                }
                if(document.Register.txtPassword.value == document.Register.txtRetypePassword.value){
                    isValid = true;
                }
                return isValid;
            }
            
            function checkUsername(){
                username = document.getElementById("Username").value;
                filter = /^[a-zA-Z0-9]{6,20}$/;
                document.getElementById("errUserName").style.cssText = 'display:none';
                if (!filter.test(username)){
                    document.getElementById("errUserName").style.cssText = 'display:block';
                    document.getElementById("errUserName").innerHTML = "Username contains 6-20 characters";
                    return false;
                }else{

                    return true;
                }



            }
            //            function GetXmlHttpObject(){
            //                var xmlHttp = null;
            //                try{
            //                    xmlHttp = new XMLHttpRequest();
            //                } catch(e) {
            //                    try{
            //                        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            //                    } catch(e) {
            //                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            //                    }
            //                }
            //                return xmlHttp;
            //            }
            function checkPassword(){
                password = document.getElementById("Password").value;
                filter = /^[a-zA-Z0-9]{6,20}$/;
                document.getElementById("errPassword").style.cssText = 'display:none';
                if (!filter.test(password)){
                    document.getElementById("errPassword").style.cssText = 'display:block';
                    document.getElementById("errPassword").innerHTML = "Password must be 6-20 characters";
                    return false;
                }else {
                    return true;
                }


            }

            function checkFullname(){
                fullname = document.getElementById("Fullname").value;
                filter = /^[a-zA-Z ,.'-]*$/;
                document.getElementById("errFullname").style.cssText = 'display:none';
                if (!filter.test(fullname)){
                    document.getElementById("errFullname").style.cssText = 'display:block';
                    document.getElementById("errFullname").innerHTML = "Full name only include letters! ";
                    return false;
                } else if (fullname.length > 50){
                    document.getElementById("errFullname").style.cssText = 'display:block';
                    document.getElementById("errFullname").innerHTML = "Input longer than 50 characters. Try again!";
                    return false;
                } else{
                    return true;
                }


            }

            function checkAddress(){
                address = document.getElementById("Address").value;
                document.getElementById("errAddress").style.cssText = 'display:none';
                if (address.length > 50){
                    document.getElementById("errAddress").style.cssText = 'display:block';
                    document.getElementById("errAddress").innerHTML = "Input longer than 50 characters. Try again!";
                    return false;
                }else{
                    return true;
                }


            }

            function checkEmail(){
                email = document.getElementById("Email").value;
                filter = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                document.getElementById("errEmail").style.cssText = 'display:none';
                if (!filter.test(email)){
                    document.getElementById("errEmail").style.cssText = 'display:block';
                    document.getElementById("errEmail").innerHTML = "Email has to follow right format <br/> ex: test@gmail.com";
                    return false;
                }else{
                    return true;
                }


            }

            function checkPhone(){
                phone = document.getElementById("Phone").value;
                filter = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
                document.getElementById("errPhone").style.cssText = 'display:none';
                if (!filter.test(phone)){
                    document.getElementById("errPhone").style.cssText = 'display:block';
                    document.getElementById("errPhone").innerHTML = "Invalid phone number <br/> ex: 01264115122";
                    return false;
                } else {

                    return true;
                }

            }
        </script>
        <script language="JavaScript">
            var witchImage = true;
            function blend(){
                if(witchImage){
                    image1.filters("blendTrans").apply();
                    image1.style.visibility = "hidden";
                    image1.filters("blendTrans").play();

                } else {
                    image2.filters("blendTrans").apply();
                    image2.style.visibility = "hidden";
                    image2.filters("blendTrans").play();
                }
            }

            function reBlend(fromImage){
                if(fromImage){
                    image1.style.zIndex -=2;
                    image1.style.visibility = "visible";

                } else {
                    image1.style.zIndex +=2;
                    image2.style.visibility = "visible";
                }
                witchImage = !witchImage;
                blend();
            }
        </script>

        <script language="JavaScript">
            function login(){
                document.getElementById("loginform").style.cssText = 'display:block';
                document.getElementById("registerform").style.cssText = 'display:none';
            }


        </script>
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
                        <div id="registerform">
                            <form name ="Register" action="AccountController" method="POST" onsubmit="return onSubmit();">
                                <div id="reg" class="rounded-corners">

                                    <table id="RegisterTable">
                                        <div style="color: #1a7fc3;font-size: 17px;font-weight: bold;">
                                            Register Form
                                        </div>
                                        <br/><br/>
                                        <tr>
                                            <td style="width: 120px">
                                                <div class="editor-label" style="float: right">
                                                    Username(*)
                                                </div>

                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Username" name="txtUsername" onkeyup="checkUsername()" onchange="isExisted()" style="width:180px; -webkit-border-radius: 2px;" type="text" value="">
                                                    <span id="errUserName" style="color: red; display: none"></span>
                                                    <span id="regisName" style="color: red; display: none"></span> </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="editor-label" style="float: right">
                                                    Password(*)
                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Password" name="txtPassword" onkeyup="checkPassword()" style="-webkit-border-radius: 2px; width:180px" type="password">
                                                    <span id="errPassword" style="color: red; display: none"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="editor-label" style="float: right">
                                                    Confirm Password(*)
                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="RetypePassword" name="txtRePassword" style="-webkit-border-radius: 2px; width:180px" type="password" value="">
                                                    <span id="errRePassword" style="color: red; display: none"></span>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px">
                                                <div class="editor-label" style="float: right">
                                                    Fullname(*)

                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Fullname" name="txtFullName" onkeyup="checkFullname()" style="-webkit-border-radius: 2px; width:220px" type="text" value="">
                                                    <span id="errFullname" style="color: red; display: none"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="editor-label" style="float: right">
                                                    Address(*)

                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Address" name="txtAddress" onkeyup="checkAddress()" style="-webkit-border-radius: 2px; width:220px" type="text" value="">
                                                    <span id="errAddress" style="color: red; display: none"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="editor-label" style="float: right">
                                                    Email(*)
                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Email" name="txtMail" onkeyup="checkEmail()" onchange="isExistedEmail()" style="-webkit-border-radius: 2px; width:220px" type="text" value="">
                                                    <span id="errEmail" style="color: red; display: none"></span>
                                                    <span id="regisMail" style="color: red; display: none"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="editor-label" style="float: right">
                                                    Phone(*)
                                                </div>
                                            </td>
                                            <td>
                                                <div class="editor-field">
                                                    <input id="Phone" name="txtPhone" onkeyup="checkPhone()" style="-webkit-border-radius: 2px; width:120px" type="text" value="">
                                                    <span id="errPhone" style="color: red; display: none"></span>

                                                </div>
                                            </td>
                                        </tr>

                                    </table>                                    



                                    <div style="margin-top: 5px">
                                        <input class="regbutton" type="submit" name="action" value="Register"
                                               style="float:left;margin-right:18px;width: 60px;height: 30px;background-color: #D4D4D8;font-size: 12px;margin-left: 130px;">
                                        <input class="regbutton" type="reset" name="action" value="Reset"
                                               style="width: 60px;height: 30px;background-color: #D4D4D8;font-size: 12px;">
                                    </div>
                                    <div id="errorMsgReg"></div>
                                </div>
                            </form>
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