/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var modalWin = new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("images/loading.gif");
 modalWin.SetCloseButtonImagePath("images/remove.gif");
 //Uncomment below line to make look buttons as link
 //modalWin.SetButtonStyle("background:none;border:none;textDecoration:underline;cursor:pointer");

function ShowNewPage(){
 var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
 modalWin.ShowURL('AddRestaurant1.jsp',470,600,'Hotel Registration',null,callbackFunctionArray);
 }
 
 function SearchHotels(){
 var callbackFunctionArray = new Array(EnrollNow, EnrollLater);
 modalWin.ShowURL('SearchHotels.jsp',470,600,'Search Hotel Details',null,callbackFunctionArray);
 }
 
function Action1(){
modalWin.HideModalPopUp();
}

function Action2(){
alert('Action2 is excuted');
modalWin.HideModalPopUp();
}

function EnrollNow(msg){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

function EnrollLater(){
modalWin.HideModalPopUp();
modalWin.ShowMessage(msg,200,400,'User Information',null,null);
}

function HideModalWindow() {
    modalWin.HideModalPopUp();
}

function  ShowMessageWithAction(){
    //ShowConfirmationMessage(message, height, width, title,onCloseCallBack, firstButtonText, onFirstButtonClick, secondButtonText, onSecondButtonClick);
    modalWin.ShowConfirmationMessage('Hotel Registered Successfully',200,400,'User Confirmation',null,'Ok',Action1);
 }

function ShowChildWindowValues(name,email,address,phone,zip) {
    var displayString = "<b>Values Of Child Window</b> <br><br>Name : " + name;
    displayString += "<br><br>Email : " + email;
    displayString += "<br><br>Address : " + address;
    displayString += "<br><br>Phone : " + phone;
    displayString += "<br><br>Zip : " + zip;
    var div = document.getElementById("divShowChildWindowValues");
    div.style.display = "";
    div.innerHTML = displayString;
}


