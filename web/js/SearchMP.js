/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function search(){

    xmlhttp = GetXmlHttpObject();
    if(xmlhttp==null){
        alert("Your brownser does not support ajax HTTP");
        return ;
    }
    //alert(document.myForm.txtSearch.value);
    var url = "SearchMP?action=search";
    url+= "&txtSearch="+document.myForm.txtSearch.value;

    //alert(url);


    xmlhttp.onreadystatechange=getresultSearch;
    xmlhttp.open("GET", url, true);
    xmlhttp.send(null);

}

function getresultSearch(){

//        //alert("da vao result");
//        var xmlfile = "xml/Search.xml";
//        var xslfile = "xsl/ManageProduct.xsl";
//
//        //alert("bbbbbbb");
//        if (window.XMLHttpRequest)
//        {// code for IE7+, Firefox, Chrome, Opera, Safari
//            //alert("FF1");
//            var xmlhttp = new XMLHttpRequest();
//        }
//        else
//        {// code for IE6, IE5
//            //alert("IE1");
//            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
//        }
//        xmlhttp.open("GET",xmlfile,false);
//        xmlhttp.send();
//        var xmlDOM = xmlhttp.responseXML;
//
//        //alert(xmlDOM);
//
//        var xsltProcessor = new XSLTProcessor();
//
//        // load the xslt file
//        var myXMLHTTPRequest = new XMLHttpRequest();
//        myXMLHTTPRequest.open("GET", xslfile, false);
//        myXMLHTTPRequest.send(null);
//
//        // get the Xslt document
//        xslStylesheet = myXMLHTTPRequest.responseXML;
//        xsltProcessor.importStylesheet(xslStylesheet);
//
//        //alert(xsltProcessor);
//        //transform
//        var resultDocument = xsltProcessor.transformToFragment(xmlDOM, document);
//        //alert(resultDocument);
//        document.getElementById("result").innerHTML="";
//        document.getElementById("result").appendChild(resultDocument);

}

function GetXmlHttpObject()
{
    if (window.XMLHttpRequest)
    {
        return new XMLHttpRequest();
    }
    if (window.ActiveXObject)
    {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    return null;
}