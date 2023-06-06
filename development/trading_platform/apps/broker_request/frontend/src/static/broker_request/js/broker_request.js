// Jovan Jovanovic 2020/0083
let scroll = document.getElementById("scroll");
let content = document.getElementById("content");
let box = document.getElementById("check");
let button = document.getElementById("button"); 

function omoguciCheckBox() {
    box.disabled = false;
}

box.onchange = function(){
    if(box.checked) {
        // button.removeClass("buttonDis");
        // button.addClass("buttonEn");
        button.classList.remove("buttonDis");
        button.classList.add("buttonEn");
        button.disabled = false;
    } else {
        // button.removeClass("buttonEn");
        // button.addClass("buttonDis");
        button.classList.remove("buttonEn");
        button.classList.add("buttonDis");
        button.disabled = true;
    }
}

scroll.onscroll = function(){
    var total = scroll.scrollTop + scroll.clientHeight;

    //alert(contet.clientHeight)
    if(total >= 570){
        omoguciCheckBox();
    } 
}