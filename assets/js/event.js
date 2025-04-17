
// var input = document.querySelectorAll('input[name=visitor]');
// // input.addEventListener('change', handler);
// // function handler(e){
// //   console.log(e.target);
// // }
// var newElement = document.createElement('span');
// var getElement = document.querySelector('#demo');

// Array.from(input).map(inp =>{
//   inp.addEventListener('change', handler);

//   function handler(e){
//     var number = e.target.value;
//     if(e.target.checked){
//       if(number == "Arjun"){
//         console.log('Hi I am Arjun');
//         var content = document.createTextNode('I am From JavaScript');
//         newElement.appendChild(content);

//         newElement.style.color = "#fff";
//         getElement.appendChild(newElement);
//       }
//     }
//   }
// });

// const textArea = document.querySelector("textarea");

// textArea.addEventListener('change',(e)=>{
//   var content = textArea.value;
//   console.log(content);
// });

// ======== on Submit Event

const form = document.querySelector('form');
const name = form.querySelector('div div #first_name');
const phone = form.querySelector('div div #phone');
const detail = form.querySelector('div #detail');

form.addEventListener('submit', formSubmit);

function formSubmit(e){
    e.preventDefault();
    console.log(detail);
    var student = {
        'name' : name.value,
        'phone' : phone.value,
        'detail' : detail.value,
    }
    console.log(student);

    name.value = '';
    phone.value = '';
    detail.value = '';
}