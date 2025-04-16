
var input = document.querySelectorAll('input[name=visitor]');
// input.addEventListener('change', handler);
// function handler(e){
//   console.log(e.target);
// }
Array.from(input).map(inp =>{
  inp.addEventListener('change', handler);

  function handler(e){
    var number = e.target.value;
    if(e.target.checked){
      if(number == "Arjun"){
        console.log('Hi I am Arjun');

        var newElement = document.createElement('span');
        var getElement = document.querySelector('#demo');
        newElement.createTextNode('I am From JavaScript');
        getElement.appendChild(newElement);
      }
    }
  }
});