/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function isNumberKey(txt, evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode == 46) {
        //Check if the text already contains the . character
        if (txt.value.indexOf('.') === -1) {
            return true;
        } else {
            return false;
        }
    } else {
        if (charCode > 31 &&
                (charCode < 48 || charCode > 57))
            return false;
    }
    return true;
}

function enableDisableFields(checkbox, targetField){
    if(checkbox.checked){
        targetField.disabled=false;
        targetField.readonly=false;
    }else{
        targetField.value="";
        targetField.disabled=true;
        targetField.readonly=true;
    }
}
