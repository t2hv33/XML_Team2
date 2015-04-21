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


        <title>X-SHOP Computer</title>

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
                        <ul class="ListProduct">

                            <div id="yw1" class="list-view">
                                <div class="keys" style="display:none" title="/"><span>73</span><span>72</span><span>71</span><span>70</span><span>69</span><span>68</span><span>67</span><span>66</span><span>65</span><span>64</span><span>63</span><span>62</span><span>61</span><span>60</span><span>59</span><span>58</span></div>
                                <div class="summary"></div>

                                <div class="items" id="result">


                                    <c:import url="xml/Duy.xml" var="xmldoc"/>
                                    <c:import url="xsl/product.xsl" var="xsldoc"/>
                                    <x:transform xml="${xmldoc}" xslt="${xsldoc}"/>

                                </div>
                                <div id="Product-Detail" style="display: none"></div>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
            <!--begin footer-->
            <%@ include file="footer.jsp" %>      
            <!--End:footer-->
        </div>

    </body>

</html>