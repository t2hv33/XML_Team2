/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function ViewDetail(PID){
     var childs;
    var domxml;
    //alert("cccc");
    var xmlFile = "xml/Duy.xml";
    var xslFile = "xsl/ViewDetail.xsl";

    new_xmlDOMt = null;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        // alert("FF1");
        var xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        //  alert("IE1");
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET",xmlFile,false);
    xmlhttp.send();
    var xmlDOM = xmlhttp.responseXML;
    //alert(xmlDOM);

    if(xmlDOM != null){
        childs = xmlDOM.childNodes;
        for(var i=0;childs.length;i++){
            if(childs[i].nodeName=='Allproduct'){
                childs = childs[i].childNodes;
                break;
            }
        }
        for(var i=0;i<childs.length;i++){
            var childs2 = childs[i].childNodes;
            for(var j=0;j<childs2.length;j++){
                if(childs2[j].nodeName=='PID'){
                    if(childs2[j].textContent==PID){
                        domxml1 = childs[i];
                        break;
                    }
                    continue;
                }
            }
        }
    }

    domxml = '<Allproduct xmlns:pro="http://xml.netbeans.org/schema/Product">';
    domxml += (new XMLSerializer()).serializeToString(domxml1);
    domxml += "</Allproduct>";

    parser = new DOMParser();
        xml = parser.parseFromString(domxml,"text/xml");

        //alert(xml);

        // load the xslt file
        var myXMLHTTPRequest = new XMLHttpRequest();
        myXMLHTTPRequest.open("GET", xslFile, false);
        myXMLHTTPRequest.send(null);
        //alert("103");
        // get the XML document
        xsltProcessor=new XSLTProcessor();
        xslStylesheet = myXMLHTTPRequest.responseXML;
        xsltProcessor.importStylesheet(xslStylesheet);
        //alert(xsltProcessor);
        //alert("rrrrr");
        var resultDocument = xsltProcessor.transformToFragment(xml, document);
        //alert(resultDocument);
        document.getElementById("result").innerHTML="";
        document.getElementById("result").appendChild(resultDocument);
        

}
