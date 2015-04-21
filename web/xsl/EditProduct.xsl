<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : EditProduct.xsl
    Created on : May 5, 2013, 7:54 PM
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

                <xsl:apply-templates/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="productList">

        <div class="span6">
            <div style="background-color:#f5f5f5; margin-top: 10px; width:550px; min-height: 610px; padding: 10px; border:1px gray solid;">
                <h4>Edit Product</h4>
                <br/>
                <div class="form" style="float: left">
                    <form action="EditProduct" enctype="multipart/form-data" name="addform" method="post" onsubmit="return validate(this)" accept-charset="utf-8">
                        <p class="note">Fields with
                            <span class="required">*</span> are required.
                        </p>

                        <div class="row" style="display: none">

                            <input type="text" name="txtpID" readonly="true">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="PID"/>
                                </xsl:attribute>
                            </input>
                        </div>

                        <div class="row">
                            <label class="required">Category
                                <span class="required">*</span>
                            </label>
                                               
                            <select name="txtCategory">
                                <option>Soft</option>
                                <option>USB</option>
                                <option>HeadPhone</option>
                                <option>KeyBoard</option>
                                <option>Mouse</option>
                            </select>
                        </div>
                        
                        <div class="row">
                            <label class="required">Name
                                <span class="required">*</span>
                            </label>
                            <input size="50" maxlength="128" title="Enter name" name="txtName" type="text">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="Name"/>
                                </xsl:attribute>
                            </input>
                            <div id="alert_name"></div>
                        </div>
                        <div class="row">
                            <label  class="required">Description
                                <span class="required">*</span>
                            </label>
                            <textarea rows="6" cols="52" title="Enter the content to send" name="txtDescription" >
                                <xsl:value-of select="Description"/>
                            </textarea>
                        </div>
                        <div class="row">
                            <h4>Image</h4>
                            <div class="input-control text">
                                <input type="file" name="txtImage" id="files"/>
                                <div id="show"></div>
                            </div>
                            <h4>Old Image</h4>
                            <img class="thumb">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="Image"/>
                                </xsl:attribute>
                            </img>
                        </div>
                        <div class="row" style="display: none">
                            <input type="text" name="txtOldImage" readonly="true">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="Image"/>
                                </xsl:attribute>
                            </input>
                        </div>
                        <div class="row">
                            <label class="required">Price
                                <span class="required">*</span>
                            </label>
                            <input size="50" maxlength="128" name="txtPrice"  type="text" >
                                <xsl:attribute name="value">
                                    <xsl:value-of select="Price"/>
                                </xsl:attribute>
                            </input>
                            <div id="alert_price"></div>
                        </div>
                        <div class="row">
                            <label class="required">InStock
                                <span class="required">*</span>
                            </label>
                            <input size="50" maxlength="128" name="txtInstock" type="text">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="Instock"/>
                                </xsl:attribute>
                            </input>
                            <div id="alert_instock"></div>
                        </div>
                        <div class="row submit">
                            <input type="submit" value="Update" name="btAction" />
                            <input type="reset" value="Reset"/>
                            <input type="button" value="Cancel" onclick="" />
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </xsl:template>


</xsl:stylesheet>
