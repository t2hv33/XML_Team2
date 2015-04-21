<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : ManageProduct.xsl
    Created on : May 5, 2013, 7:46 PM
    Author     : duy
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            
            </head>
            <body>
                <div style="background-color:#f5f5f5; width:750px; min-height: 610px; padding: 10px; border:1px gray solid; ">
                    <table border="2" id="dataTable">
                        <thead>
                            <tr>
                                <th width="100px">NAME</th>
                                <th width="100px">PRICE</th>
                                <th width="80px">DESCRIPTION</th>
                                <th width="80px">CATEGORY</th>
                                <th>IMAGE</th>
                                <th>INSTOCK</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates/>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Allproduct">
        <xsl:for-each select="productList">            
            <tr>
                <td>
                    <xsl:value-of select="Name"/>
                </td>
                <td>
                    <xsl:value-of select="Price"/> VND
                </td>
                <td>
                    <textarea rows="7" cols="36" readonly="true">
                        <xsl:value-of select="Description"/>
                    </textarea>
                </td>
                <td>
                    <xsl:value-of select="Category"/>
                </td>
                <td>
                    <img width="120px" height="120px" alt="">
                        <xsl:attribute name="src">
                            <xsl:value-of select="Image"/>
                        </xsl:attribute>
                    </img>
                </td>
                <td>
                    <xsl:value-of select="Instock"/>
                </td>
                <td>
                    <a href="#" >
                        <xsl:attribute name="onclick">
                            <xsl:value-of select="'editproduct('"/>
                            <xsl:value-of select="PID"/>
                            <xsl:value-of select="')'"/>
                        </xsl:attribute>
                        Update
                    </a>
                </td>
            </tr>            
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
