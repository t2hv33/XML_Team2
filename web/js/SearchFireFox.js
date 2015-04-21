/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function SearchDOMNode(xmlFile,xslFile){
    //document.getElementById('result').innerHTML = "out";
    //alert("bbbbbbb");
    new_xmlDOM = null;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        //alert("FF1");
        var xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        //alert("IE1");
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET",xmlFile,false);
    xmlhttp.send();
    var xmlDOM = xmlhttp.responseXML;
    //alert(xmlDOM);

    //    new_xmlDOM = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>';
    new_xmlDOM = '<Allproduct xmlns:pro="http://xml.netbeans.org/schema/Products">';
    
    //alert(document.myForm.txtSearch.value);
    searchNodeName(xmlDOM, document.myForm.txtSearch.value);

    new_xmlDOM += "</Allproduct>";

    //alert(new_xmlDOM);

    if(document.implementation && document.implementation.createDocument){
        // Mozilla

        var xsltProcessor = new XSLTProcessor();

        // load the xslt file
        var myXMLHTTPRequest = new XMLHttpRequest();
        myXMLHTTPRequest.open("GET", xslFile, false);
        myXMLHTTPRequest.send(null);

        // get the Xslt document
        xslStylesheet = myXMLHTTPRequest.responseXML;
        xsltProcessor.importStylesheet(xslStylesheet);

        // load the xml file
        if (window.DOMParser)
        {
           // alert("ccccc");
            parser = new DOMParser();
            xml = parser.parseFromString(new_xmlDOM,"text/xml");
            //alert(xml);
        }
        else // Internet Explorer
        {
            xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.async = false;
            xml.loadXML(new_xmlDOM);
        }
//alert(xsltProcessor);
        //transform
        var resultDocument = xsltProcessor.transformToFragment(xml, document);
        //alert(resultDocument);
        document.getElementById("result").innerHTML="";
        document.getElementById("result").appendChild(resultDocument);
        

    }else if(window.ActiveXObject){
        // IE
        alert("chay ben IE");
        // Load XML
        var xml = new ActiveXObject("Microsoft.XMLDOM");  //Microsoft.XMLDOM
        xml.async = false;
        xml.loadXML(new_xmlDOM);

        //        alert(xml);
        //        alert(xslFile);
        // Load XSL
        var  xsl = new ActiveXObject("Microsoft.XMLDOM");
        xsl.async = false;
        xsl.load(xslFile);
        //        alert(xsl);

        // Transform   transformNode

        if(xml.parseError.errorCode!=0){
            alert("XML loi");
            alert("Error1:" + xml.parseError.reason);
        } else if(xsl.parseError.errorCode!=0){
            alert("Error2:" + xsl.parseError.reason);
        } else{
            var out = xml.transformNode(xsl);
            //                    alert(out);
            document.getElementById('result').innerHTML = out;
        }


        //        alert("transform IE");
        //        var out = xml.transformNode(xsl);
        alert(out);
    //        document.getElementById('result').innerHTML = out;
    }

}


function searchNodeName(node, strSearch){
    // search dung domtree trong firefox

    myForm.txtSearch.text = strSearch;
    //alert("vao search node roi");
    strSearch = strSearch.toLowerCase();
    if (node == null) {
        alert("null");
        return;
    }

    if (node.tagName == "Name") {
        //alert("vao ham if");
        var tmp = node.firstChild.nodeValue.toLowerCase();
        //alert(tmp);
        if (tmp.indexOf(strSearch, 0) > -1) {
          //  alert(tmp.indexOf(strSearch, 0));
            //            var preNode = node.nextSibling;
            //            alert(preNode.nodeValue);
            //            var preNode = node.nextSibling;
          //  alert(node.previousElementSibling.firstChild.nodeValue);
            //                        var preNode = node.nextSibling;
            //                        alert(preNode.firstChild.nodeName);
            new_xmlDOM += "<productList>";
            new_xmlDOM += "<PID>" + node.previousElementSibling.firstChild.nodeValue + "</PID>";
            new_xmlDOM += "<Name>" + node.firstChild.nodeValue + "</Name>";
            //alert(node.firstChild.nodeValue);
            var sibling = node.nextElementSibling;
            new_xmlDOM += "<Price>" + sibling.firstChild.nodeValue + "</Price>";
            sibling = sibling.nextElementSibling;
            new_xmlDOM += "<Description>" + sibling.firstChild.nodeValue + "</Description>";
            sibling = sibling.nextElementSibling;
            new_xmlDOM += "<Category>" + sibling.firstChild.nodeValue + "</Category>";
            sibling = sibling.nextElementSibling;
            new_xmlDOM += "<Image>" + sibling.firstChild.nodeValue + "</Image>";
            sibling = sibling.nextElementSibling;            
            new_xmlDOM += "<Instock>" + sibling.firstChild.nodeValue + "</Instock>";
            new_xmlDOM += "</productList>";
        }
    }
    var childs = node.childNodes;
    for (var i = 0; i < childs.length; i++){
        searchNodeName(childs[i], strSearch);
    }
}
