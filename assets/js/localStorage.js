
localStorage.setItem("mode","dark");
localStorage.setItem("name","Juyel");

let car = ['Volvo','Audi','Hundai'];

localStorage.setItem("name",JSON.stringify(car));

const hello = JSON.parse(localStorage.getItem("name"));
console.log(hello);

// localStorage.clear('mode');