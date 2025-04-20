const save = document.querySelector('#save');
const message = document.querySelector('#status');

save.addEventListener('click',messageShow);

// function messageShow(){
//   message.innerText = "Submit Successfully";
//   setTimeout(function(){
//    message.innerText = '';
//   } , 2000);
// }
function messageShow(){
  let count = 0;
  message.innerHTML = count;

  setInterval(()=>{
    count++
    message.innerHTML = count;
  },1000);
}

let number = 0;
setInterval(()=>{
  number++
  console.log(number);
}, 1000);

function repeat() {
  console.log('Hello');
  setTimeout(repeat, 1000);
}
repeat();