
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

function FetchSum(a){
    return a;
}
let numbers = [2,4,6];
let number2 = [7,8,9];

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