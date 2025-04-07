// ------- Dom Event Handler

// var element = document.getElementById('demo')

// var text = element.innerText;
// console.log(text);

// function myName(){
//     let number = Math.ceil(Math.random()*10);
//     document.getElementById('output').innerHTML = number;
// }
// var imageTake = document.querySelector('#imageShow');

// function image1(){
//     imageTake.src = '../images/id.jpg';
// }

// function image2(){
//     imageTake.src = '../images/juyel.jpg';
// }


// create new element for a html
// var h1Header = document.createElement('span');
// var contentHeader = document.createTextNode('This Is From Span Tag');
// h1Header.appendChild(contentHeader);

// var content = document.getElementById('li_content');
// content.appendChild(h1Header);

// h1Header.classList.add('Heading');

var fruits = ['mango','apple','grave','guava'];
var ulList = document.getElementById('ul_list');

fruits.forEach(fruit => {
  const li = document.createElement('li');
  li.textContent = fruit;
  li.classList.add('active');
  ulList.appendChild(li);
});
document.getElementById('list-container').appendChild(ulList);

var activeClass = document.querySelectorAll('#ul_list li');

activeClass.forEach(item => {
    item.addEventListener('click', function(){
        activeClass.forEach(li => {li.innerHTML = 'juyel'});
        item.innerHTML = "Hello";
    });
});