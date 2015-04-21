/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var Name = /^[a-zA-Z0-9_-]{6,100}$/;
var Price = /^\+?[0-9]\d*$/;
var Instock =  /^\+?[1-9]\d*$/;


function validate(form){
    //alert("da vao validate");
    var name = form.txtName.value;
    var price = form.txtPrice.value;
    var instock = form.txtInstock.value;
    //alert(name);
    //alert(price);
    //alert(instock);
    var errors = [];
    //alert(name.length);
    if(name.length<6 || name.length>35){
        //alert("name sai");
        document.getElementById("alert_name").innerHTML='<font color="red">Name has 6 to 35 charaters</font>';
        form.txtName.focus();
        return false;
    }else{
        document.getElementById("alert_name").innerHTML="";
    }
    if(!Price.test(price) || price<500){
        document.getElementById("alert_price").innerHTML='<font color="red">Price must be integer and larger than 500</font>';
        form.txtPrice.focus();
        return false;
    }else{
        document.getElementById("alert_price").innerHTML="";
    }
    if(!Instock.test(instock)){
        document.getElementById("alert_instock").innerHTML='<font color="red">Instock must be integer and larger than 1</font>';
        form.txtInstock.focus();
        return false;
    }else{
        document.getElementById("alert_instock").innerHTML="";
    }
    
    return true;
}

