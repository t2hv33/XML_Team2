<%-- 
    Document   : ManageProduct
    Created on : May 5, 2013, 3:38:44 PM
    Author     : thanhhvG
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
        <script type="text/javascript" src="js/SearchMP.js"></script>
        <!-- start: Favicon -->
        <link rel="shortcut icon" href="images/x-p.png"/>
          <title>Manage Product</title>
        <!-- end: Favicon -->
        <script>
            function page(tableName, insertPerPage){
                this.tableName = tableName;
                this.itemPerPage = itemsPerPage;
                this.currentPage = 1;
                this.pages = 0;
                this.inited = false;
                alert("vap page rui");
                this.showPro = function(from,to){
                    var rows = document.getElementById(tableName).rows;
                    // i start from 1 to skip table header row
                    for(var i=1;i<rows.length;i++){
                        if(i< from || i>to){
                            rows[i].style.display= 'none';
                        } else {
                            rows[i].style.display ='';
                        }
                    }
                }
                this.showPage = function(pageNumber){
                    if(! this.inited){
                        alert("not inited");
                        return;
                    }

                    var oldPageAnchor = document.getElementById('pg'+ this.currentPage);
                    oldPage.className = 'pg-normal';

                    this.currentPage = pageNumber;
                    var newPageAnchor = document.getElementById('pg'+this.currentPage);
                    newPageAnchor.className= 'pg-selected';

                    var from = (pageNumber-1)* itemsPerPage + 1;
                    var to = from + itemsPerPage -1;
                    this.showPro(from, to);

                }

                this.showPageNav = function(paperName,positionId){
                    if(! this.inited){
                        alert(" not inited");
                        return;
                    }
                    var element = document.getElementById(positionId);

                    var pagerHtml ='<span onclick"' + paperName + '.prev();" class="pg-normal">&#171 prev </span> |';
                    for (var page = 1; page <= this.pages;page++)
                        paperHtml+= '<span id="pg' + page + '" class="pg-normal" onclick="'
                        + paperName + '.showPage(' + page + ');">' + page + '</span>|';
                    paperHtml+= '<span onclick="'+paperName+'.next();" class="pg-normal"> Next &#187;</spam>';
                    element.innerHTML = pagerHtml;
                }
            }
            
        </script>
        <title>Project X Computer</title>

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
                    <%@ include file="menuMP.jsp"%>
                    <!--End: Sub menu-->

                    <div class="SubContent02">
                        <div class="items" id="result">

                            <div class="span6">

                                <c:import url="xml/Duy.xml" var="xmldoc"/>
                                <c:import url="xsl/ManageProduct.xsl" var="xsldoc"/>
                                <x:transform xml="${xmldoc}" xslt="${xsldoc}"/>

                                <div id="pageNavPosition" style="padding-top: 20px" align="center"></div>
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
    <!--   <script type="text/javascript">
           alert("vao alert rui");
           var paper = new page('dataTable', 5);
           paper.init();
           paper.showPageNav('paper', 'pageNavPosition');
           paper.showPage(1);
       </script>  -->
    <script type="text/javascript">
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
