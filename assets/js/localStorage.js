
// localStorage.setItem("mode","dark");
// localStorage.setItem("name","Juyel");

// let car = ['Volvo','Audi','Hundai'];

// localStorage.setItem("name",JSON.stringify(car));

// const hello = JSON.parse(localStorage.getItem("name"));
// console.log(hello);

// localStorage.clear('mode');
localStorage.setItem("Company","Google");

const fruits = ['Apple','Banana','Mango'];

localStorage.setItem('fruit',JSON.stringify(fruits));

console.log(fruits);
console.log(JSON.parse(localStorage.getItem('fruit')));