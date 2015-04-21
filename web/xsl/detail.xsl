<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : detail.xsl
    Created on : May 4, 2013, 7:50 PM
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
        <div id="name">
            <p>
                <xsl:value-of select="Name"/>
            </p>
        </div>
        
        <div style="height:160px;width:130px;float:left;margin:3px;">
            <img id="Image-Detail" >
                <xsl:attribute name="src">
                    <xsl:value-of select="Image"/>
                </xsl:attribute>
            </img>
        </div>
        <div id="descreption">
            <p>
                <xsl:value-of select="Description"/>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>
