function validateName() { 
  let name = document.forms["entrolle"]["full-name"].value;
  var letters = /^[A-Za-z]+$/;
  if (name == "") {
    document.getElementById("nameerror").innerHTML="Please Fill out your name";
    document.getElementById("validname").innerHTML="";

    return false;
  
  } else{
    if(name.match(letters)){
      validinput ="yes";
      document.getElementById("validname").innerHTML="Looks Good!";
      document.getElementById("nameerror").innerHTML="";
      return true;
    } else {
      document.getElementById("nameerror").innerHTML="Name must have alphabet characters only";
      document.getElementById("validname").innerHTML="";
      return false;
    }
  } 
}

function validateImage(){
  var urlFilter = new RegExp('^(https?:\\/\\/)?'+ // protocol
  '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
  '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
  '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
  '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
  '(\\#[-a-z\\d_]*)?$','i');
  var imageUrlFilter = /(https?:\/\/.*\.(?:png|jpg))/i;
  let image = document.forms["entrolle"]["image-link"].value;
  if(image ==""){
    document.getElementById("linkerror").innerHTML="Please provide your image link";
    document.getElementById("valilink").innerHTML="";
    return false;
  }
  else{
    if(!imageUrlFilter.test(image) || !urlFilter.test(image)){
      document.getElementById("linkerror").innerHTML="Please provide valid image link";
      document.getElementById("valilink").innerHTML="";
      return false;
    }
    else{
      document.getElementById("linkerror").innerHTML="";
      document.getElementById("valilink").innerHTML="Image is Loaded Sucessfully!";
      return true;
    }
   
  }
  
}

function validateEmail(){
  var emailFilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  let emailID = document.forms["entrolle"]["e-mail"].value;
  if(emailID ==""){
    document.getElementById("emailerror").innerHTML="Please provide your e-mail address";
    document.getElementById("validemail").innerHTML="";
    return false;
  }
  else{
    if (!emailFilter.test(emailID)) {
      document.getElementById("emailerror").innerHTML="Please provide a valid e-mail address";
      document.getElementById("validemail").innerHTML="";
      return false;
    }
    else{
      document.getElementById("emailerror").innerHTML="";
      document.getElementById("validemail").innerHTML="e-mail address is verified sucessfully!";
      return true;
    }

  }

}

function validateURL(){
  var urlFilter = new RegExp('^(https?:\\/\\/)?'+ // protocol
  '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
  '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
  '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
  '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
  '(\\#[-a-z\\d_]*)?$','i');
  let website = document.forms["entrolle"]["url"].value;
  if(website ==""){
    document.getElementById("urlerror").innerHTML="Please provide your website address";
    document.getElementById("validurl").innerHTML="";
    return false;
  }
  else{
    if (!urlFilter.test(website)) {
      document.getElementById("urlerror").innerHTML="Please provide a valid website address";
      document.getElementById("validurl").innerHTML="";
      return false;
    }
    else{
      document.getElementById("urlerror").innerHTML="";
      document.getElementById("validurl").innerHTML=" Website is verified Succesfully!";
      return true;
    }
  }
}



function displayRadioValue() {
  var ele = document.getElementsByName('gridRadios');
    
  for(i = 0; i < ele.length; i++) {
      if(ele[i].checked)
        return ele[i].value;
  }
}

function getCheckBoxValue() {
  var skillList = [];
  var checkboxes = document.getElementsByName('skill');
  for (var checkbox of checkboxes) {
      if (checkbox.checked) {
          skillList = skillList + checkbox.value + ' ';
      }
  }
  return skillList;
    
}


function addRow(){
  var validinput = "yes";

  if( validateName() && validateEmail() && validateURL() && validateImage()){
    const person = {
      fullname: document.getElementById("full-name").value,
      email: document.getElementById("e-mail").value,
      website:document.getElementById("url").value,
      imagelink: document.getElementById("image-link").value,
      gender: displayRadioValue(), 
      skills: getCheckBoxValue() 
  
    };

    var n =1;
    var Addrow = document.getElementById("mytable");

    var newRow = Addrow.insertRow(n);
    newRow.setAttribute("class","bodyRow");

    var cel1 = newRow.insertCell();
    var cel2 = newRow.insertCell();

    var sname = document.createElement("h6");
    var nameText = document.createTextNode(person.fullname);
    sname.appendChild(nameText);
    cel1.appendChild(sname);

    var sgender = document.createElement("h6");
    var genderText = document.createTextNode(person.gender);
    sgender.appendChild(genderText);
    cel1.appendChild(sgender);

    var semail = document.createElement("h6");
    var emailText = document.createTextNode(person.email);
    semail.appendChild(emailText);
    cel1.appendChild(semail);

    var swebsite = document.createElement("a");
    swebsite.setAttribute("href", person.website)
    swebsite.setAttribute("target","_blank")

      
    var websiteText = document.createTextNode(person.website);
    swebsite.appendChild(websiteText);
    cel1.appendChild(swebsite);

    var skills = document.createElement("h6");
    var skillsText = document.createTextNode(person.skills);
    skills.appendChild(skillsText);
    cel1.appendChild(skills);

    var image = document.createElement("img");
    image.setAttribute("src",person.imagelink); 


    cel2.appendChild(image);

  }
   
}

function clean(){
  document.getElementById("validurl").innerHTML="";
  document.getElementById("validemail").innerHTML="";
  document.getElementById("validname").innerHTML="";
  document.getElementById("valilink").innerHTML="";

  document.getElementById("nameerror").innerHTML="";
  document.getElementById("linkerror").innerHTML="";
  document.getElementById("emailerror").innerHTML="";
  document.getElementById("urlerror").innerHTML="";



}

