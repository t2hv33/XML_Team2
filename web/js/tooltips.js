/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

document.onmousemove = setTooltipPos;

function setTooltipPos(e)
{
    //alert("aaaaa");
    if (!e) e = event; //make sure we have a reference to the event
    var mp = getMousePosition(e);
  //alert(mp.x);
    //alert(mp.y);
    document.getElementById("Product-Detail").style.left = (mp.x-550)+'px';
    document.getElementById("Product-Detail").style.top = (mp.y-180)+'px';
}

function getMousePosition(e)
{   
    return {x:e.pageX, y:e.pageY};
//alert("bbbb");
//    return e.pageX ? { 'x':e.pageX, 'y':e.pageY} : {
//        'x':e.clientX + document.documentElement.scrollLeft + document.body.scrollLeft,
//        'y':e.clientY + document.documentElement.scrollTop + document.body.scrollTop   };
  
//    alert(e.pageX)
}

function productonmouseover(id){
    var childs;
    var domxml;
    //alert("cccc");
    var xmlFile = "xml/Duy.xml";
    var xslFile = "xsl/detail.xsl";
    document.getElementById("Product-Detail").innerHTML="";
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
                    if(childs2[j].textContent==id){
                        domxml1 = childs[i];
                        break;
                    }
                    continue;
                }
            }
        }
    }
    
   //domxml = stringToXML(convertText(domxml1));
   //alert(domxml1);
    domxml = '<Allproduct xmlns:pro="http://xml.netbeans.org/schema/Product">';
    domxml += (new XMLSerializer()).serializeToString(domxml1);
    domxml += "</Allproduct>";
    //alert(domxml);

    if(domxml!=null){

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
        document.getElementById("Product-Detail").innerHTML="";
        document.getElementById("Product-Detail").appendChild(resultDocument);
        document.getElementById("Product-Detail").style.display = '';

    //        parser = new DOMParser();
    //        xml = parser.parseFromString(new_xmlDOM,"text/xml");
    //
    //        var out = xml.transformNode(xsltDOM);
    //    document.getElementById('Product-Detail').innerHTML = out;
    //        alert("da transform duoc");
    //        document.getElementById("Product-Detail").style.display = '';
    //        alert("end");

    } else {
        document.getElementById("Product-Detail").style.display = 'none';
    }

   

//    if(domxml!=null){
//        transform('xsl/productDetail.xsl',domxml,'Product-Detail');
//        document.getElementById("Product-Detail").style.display = '';
//
//    } else {
//        document.getElementById("Product-Detail").style.display = 'none';
//    }
}

function productmouseout(){
    //alert("dddd");
    document.getElementById("Product-Detail").innerHTML="";
    document.getElementById("Product-Detail").style.display = 'none';
}