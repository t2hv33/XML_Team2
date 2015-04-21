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
        <title>Add new product</title>




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
                        <div class="items" id="result" style="margin-top: -10px;">
                            <div class="span6">
                                <div style="background-color:#f5f5f5; margin-top: 10px; width:550px; min-height: 610px; padding: 20px; border:1px gray solid;">
                                    <h4>Thêm sản phẩm</h4><br>
                                    <div class="form" style="float: left">
                                        <form action="AddProduct" enctype="multipart/form-data" name="addform" method="post" onsubmit="return validate(this)" accept-charset="utf-8">
                                            <p class="note">Fields with <span class="required">*</span> are required.</p>

                                            <div class="row">
                                                <label class="required">Category<span class="required">*</span></label>
                                                <!--      <input size="50" maxlength="128" title="Enter Category" name="txtCategory" type="text" value="" placeholder="Category phai la usb hay Soft hay Mouse hay key hay hphone" >  -->
                                                <select name="txtCategory">
                                                    <option>Soft</option>
                                                    <option>USB</option>
                                                    <option>HeadPhone</option>
                                                    <option>KeyBoard</option>
                                                    <option>Mouse</option>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <label class="required">Name<span class="required">*</span></label>
                                                <input size="50" maxlength="128" title="Enter name" name="txtName" type="text" value="" />
                                                <div id="alert_name"></div>
                                            </div>
                                            <div class="row">
                                                <label  class="required">Description<span class="required">*</span></label>
                                                <textarea rows="6" cols="52" title="Enter the content to send" name="txtDescription" ></textarea>
                                            </div>
                                            <div class="row">
                                                <h4>Image</h4>
                                                <div class="input-control text">
                                                    <input type="file" name="txtImage" value="" id="files"/>
                                                    <div id="show"></div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="required">Price<span class="required">*</span></label>
                                                <input size="50" maxlength="128" title="Enter price" name="txtPrice"  type="text" value="" >
                                                <div id="alert_price"></div>
                                            </div>
                                            <div class="row">
                                                <label class="required">InStock<span class="required">*</span></label>
                                                <input size="50" maxlength="128" title="Enter instock" name="txtInstock" type="text" value="">
                                                <div id="alert_instock"></div>
                                            </div>
                                            <div class="row submit">
                                                <input type="submit" value="Add" name="btAction" />
                                                <input type="reset" value="Reset"/>
                                                <input type="button" value="Cancel" onclick="" />
                                            </div>
                                        </form>
                                    </div>
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
    <script>
        function handleFileSelect(evt) {
            var files = evt.target.files; // FileList object
            //alert("vao rui");
            // Loop through the FileList and render image files as thumbnails.
            for (var i = 0, f; f = files[i]; i++) {
        
                // Only process image files.
                if (!f.type.match('image.*')) {
                    continue;
                }

                var reader = new FileReader();

                // Closure to capture the file information.
                reader.onload = (function(theFile) {
                    return function(e) {
                        // Render thumbnail.
                        //alert("render");
                        var span = document.createElement('span');
                        span.innerHTML = ['<img class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
                        document.getElementById('show').innerHTML="";
                        document.getElementById('show').insertBefore(span, null);
                        //alert("end");
                    };
                })(f);

                // Read in the image file as a data URL.
                reader.readAsDataURL(f);
            }
        }

        document.getElementById('files').addEventListener('change', handleFileSelect, false);
    </script>
</html>