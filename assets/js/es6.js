
// 1.
// hoisting and strict mode
// can access 
//  a = 20;
// console.log(a); output : 20;
// var a; 

// can not be access
// x = 20;
// console.log(x);
// let x;

// var name = 'Juyel';
// const college = 'Govt. College';
// function greeting(){
    // if(true){
    //   var name = 'Raihan';

     // note :If you declare a var variable inside a function, it's only accessible within that function (and any nested functions). If you declare it outside any function, it becomes a global variable. so greeting is a function.

    //   const fruits = 'Mango';
     // fruits = 'banana'; //TypeError: Assignment to constant variable.
    //   console.log(`Hello ${name}. You are from ${college}`);
    // }
    // console.log(name); // function scoped output : Raihan
    //console.log(fruits); //ReferenceError: fruits is not defined
// }
// console.log(college);
// greeting();

// var variable is function scoped or global scoped. 

// let and const varibale is  Block-scoped. A let variable is only accessible within the block of code (defined by curly braces {}) where it's declared. This includes if statements, for loops, etc

// 2. Default parameter and rest parameter

// deafult parameter
// function myself(name = "Kabir"){
//     console.log(name);
// }
// myself();

// function sumAll(a,b,c,...n){
//     let total = 0;

//     for(const rest of n){
//         total+=rest;
//     }
//     // for(const item of sums){
//     //     total += item;
//     // }
//     console.log(total + a+b+c);
// }

// let number = [1,2,3,4];
// sumAll(1,2,3,4,5,6);

//  3. Spread operator 

// function FetchSum(a){
//     return a;
// }
// let numbers = [2,4,6];
// let number2 = [7,8,9];

// concate Array :
// numbers.push(...number2); // outpput [2,4,6,7,8,9]
// console.log(numbers);
// let newNumber = numbers.concat(number2); // output :[2,4,6,7,8,9];
// console.log(newNumber);

// let newNumber = [...numbers,...number2]; // output :[2,4,6,7,8,9];
// console.log(newNumber);

// Obeject with concate

// const person1 = {
//     index1 : {
//         name : 'Juyel',
//          age : 26,
//     }
// }
// const person2 = {
//         index2 : {
//             name1 : 'Kabir',
//             age1 : 26,
//             }
// }

// let person = {...person1, ...person2}
// console.log(person);

// 4. object literal

// ex1
// function index(name,age){
//     let person = {
//         name,
//         age,
//         hobbies : ['garden','cricket','Movies'],
//     }
//     return person;
// }
// console.log(index('Juyel',26)); // { name: 'Juyel', age: 26, hobbies: [ 'garden', 'cricket', 'Movies' ] }

// ex2

// let cars = {
//      sum : function(){
//         return 2+3;
//      }
//     //  or
//     // sum(){
//     //    return 2+3;
//     // }

// }
// console.log(cars.sum()); // 5

// practice for object literal
// let author = "F. Scott Fitzgerald";
// let key = "year";
// const book = {
//     title : "The Great Gatsby",
//     author,
//     [key + "Published"] : 1925,
//     summary(){
//         return `${this.title} By ${this.author}`;
//     } ,
//     detail : {
//         genre : "Fiction",
//         pages : 180
//     }
// }

// console.log(book.summary()); // "The Great Gatsby by F. Scott Fitzgerald"
// console.log(book.detail.genre); // "Fiction"
// console.log(book.yearPublished);
// console.log(book);

// practice 2
// let name = 'Laptop';
// let key = 'stock';
// const product ={
//     name,
//     price : 999.9,
//     [key+"Level"] : 10,
//     isInStock(){
//             return this.stockLevel > 0;
//         },
//     specs : {
//         brand : "Tecno",
//         ram : 16,
//     }
// }

// console.log(product.isInStock());
// console.log(product.specs);

// practice 3
// let eventName = "Music Festival";
// let key = "event";

// const event = {
//     name: eventName,
//     date: "2025-04-25",
//     [key + "Type"] : "Concert",
//     getDetails(){
//         return `${this.name} on ${this.date}`;
//     },
//     location : {
//         city : "Austin",
//         venue : "City Arena"
//     },
//     set setName(setname){
//         // return `${this.name} ${this.eventType} at ${this.location.venue}`;
//         this.name = setname;
//     }
// }
// console.log(event.getDetails()); // Music Festival on 2025-4-24
// event.setName = "Video Festival";
// console.log(event.getDetails()); // Video Festival on 2025-4-24
// // console.log(event.setName("Video Festival"));

// for of and for in loop
// For of used in Array iterate and For in Used in Object Iterate

let fruits = ["Mango","Banana","Apple"];

// for(let fruit of fruits){
//     console.log(fruit);
// }

// const book = {
//     name : "The Great Gatsby",
//     published : "1925",
//     info(){
//         return `${this.name} in ${this.published}`;
//     }
// }
// for(let index in book){
//     console.log(`${index} : ${book[index]}`);
// }

// fruits.forEach((item ,index)=> {
//     for(let i = 0 ; i <= fruits.length ; i++){
//         setTimeout(() => {
//             console.log(`${index} : ${item}`);
//         }, 1000 * i);
//     }
// });
// 
// arrow function with filter and map

const student = [ {
    name : "juyel",
    age : 25,
    gpa : 4.00
},
{
    name : "Rahim",
    age : 25,
    gpa : 3.50
},
{
    name : "jasiim",
    age : 25,
    gpa : 4.50
}
]

const filterData = student.filter(function(x){
    return x.gpa >= 4.00;
}).map( y => {
    return y.age;
});

console.log(filterData);