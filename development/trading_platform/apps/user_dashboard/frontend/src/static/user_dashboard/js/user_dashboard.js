let scroll = document.getElementById("scroll");
let content = document.getElementById("content");
let box = document.getElementsByClassName("check");
let button = document.getElementById("button"); 

function omoguciCheckBox() {
    box.disabled = false;
}

// let box0 = document.getElementById("0");
// let box1 = document.getElementById("1");
// box0.onchange = function() {
//     alert("asd")
//     if(box0.checked) {
//         box1.checked = True;

//     } else {
//         box1.checked= False;
//     }
// }

// for (var i = 0; i < box.length; i++) {
//     box[i].onchange = function() {
//         if(box[i].checked) {
//             // button.removeClass("buttonDis");
//             // button.addClass("buttonEn");
//             let name = box[i].getAttribute("id")
//             name="id_choices_"+name
//             let box1 = document[i].getElementById(name);
//             box1.checked = True;

//         } else {
//             // button.removeClass("buttonEn");
//             // button.addClass("buttonDis");
//             let name = box[i].getAttribute("id")
//             name="id_choices_"+name
//             let box1 = document[i].getElementById(name);
//             box1.checked = False;
//         }
//     }
// }