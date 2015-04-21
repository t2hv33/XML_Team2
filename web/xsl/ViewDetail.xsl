<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : ViewDetail.xsl
    Created on : May 5, 2013, 11:28 AM
    Author     : duy
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="productList">

        <div class="items">

            <div class="images2" align="center">
                <div class="thumbnails" align="center">
                    <a  rel="shadowbox">
                        <img id="news-image" alt="Ảnh Minh Họa">
                            <xsl:attribute name="src">
                                <xsl:value-of select="Image"/>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
            </div>
            <div class="description2">
                <h1 class="product-title2">
                    <xsl:value-of select="Name"/>
                </h1>
                <div class="rating"></div>
                <div class="lower-section">
                    <p>
                                            Giá bán:
                        <span class="p-price">
                            <xsl:value-of select="Price"/> ( <xsl:value-of select="Promotion"/>)
                        </span>
                        <span class="p-unit"> VND</span>
                    </p>
                  
                </div>
                <div class="sales-info">
                    <p>
                        <xsl:value-of select="Description"/>
                    </p>
                    <br />
                    <input name="Product[id]" id="Product_id" type="hidden" value="14" />
                </div>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="'Cart?action=addcart'"/><![CDATA[&]]><xsl:value-of select="'pid='"/>
                        <xsl:value-of select="PID"/><![CDATA[&]]><xsl:value-of select="'name='"/>
                        <xsl:value-of select="Name"/><![CDATA[&]]><xsl:value-of select="'price='"/>
                        <xsl:value-of select="Price"/><![CDATA[&]]><xsl:value-of select="'instock='"/>
                        <xsl:value-of select="Instock"/><![CDATA[&]]><xsl:value-of select="'image='"/>
                        <xsl:value-of select="Image"/>
                    </xsl:attribute>
                    <div class="p-order"></div>
                </a>
            </div> <!--End:Description-->
        </div>

    </xsl:template>

</xsl:stylesheet>
