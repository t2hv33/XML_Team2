<%-- 
    Document   : product-detail
    Created on : May 5, 2013, 8:36:30 AM
    Author     : thanhhvG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
        <title>Product Detail</title>
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

                        <div id="yw1" class="list-view">
                            <div class="keys" style="display:none" title="/phan-mem-diet-virus-35/14-bkav-pro.html"><span>14</span></div>
                            <div class="items">

                                <div class="images2" align="center">
                                    <div class="thumbnails" align="center">
                                        <a href="../uploads/products/full-img-14.jpg" rel="shadowbox"><img id="news-image" src="../uploads/products/img-14.jpg" alt="Ảnh Minh Họa"/></a>
                                    </div>
                                </div>
                                <div class="description2">
                                    <h1 class="product-title2">BKAV Pro</h1>
                                    <div class="rating"></div>
                                    <div class="lower-section">
                                        <p>
                                            Giá bán: <span class="p-price">250,000</span><span class="p-unit"> VND</span>
                                        </p>
                                    </div>
                                    <div class="sales-info">
                                        <p>Đạt chứng chỉ Quốc tế VB100 Phần mềm tốt nhất do Hiệp hội An toàn thông tin VN bình chọn. BKAV PRO 2011 Sử dụng công nghệ chủ đạo Safe Run (thực thi an toàn). Với công nghệ đột phá này, Bkav là một trong 4 nhà sản xuất phần mềm diệt virus đầu tiên trên thế giới nghiên cứu thành công và trang bị công nghệ Safe Run trong sản phẩm.</p>
                                        <p>(2 tặng 2 với giá công ty 290.000 VNĐ/gói)</p><br />
                                        <input name="Product[id]" id="Product_id" type="hidden" value="14" />
                                    </div>
                                    <a href="#"><div class="p-order"></div></a>
                                </div> <!--End:Description-->
                            </div>
                        </div>  <!--End:List View-->
                    </div> <!--End:Sub Content-->
                </div>
            </div>
            <!Start:Footer-->
            <%@ include file="footer.jsp" %>
            <!--End:footer-->
        </div>
    </body>

</html>