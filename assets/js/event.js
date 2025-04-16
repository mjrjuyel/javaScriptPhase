
var input = document.querySelectorAll('input[name=visitor]');
// input.addEventListener('change', handler);
// function handler(e){
//   console.log(e.target);
// }
var newElement = document.createElement('span');
var getElement = document.querySelector('#demo');

Array.from(input).map(inp =>{
  inp.addEventListener('change', handler);

  function handler(e){
    var number = e.target.value;
    if(e.target.checked){
      if(number == "Arjun"){
        console.log('Hi I am Arjun');
        var content = document.createTextNode('I am From JavaScript');
        newElement.appendChild(content);

        newElement.style.color = "#fff";
        getElement.appendChild(newElement);
      }
    }
  }
});