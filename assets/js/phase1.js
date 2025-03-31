// Phase 1
// const name = 'Juyel';
// const income = 25000;
// const expense = 20000;

// console.log('🫡 Name : ' + name.toUpperCase() + '.\n Income Is : $' + income + '. \n Expense is : $' + expense);


// Phase 2

// const name = 'Juyel';
// const income = 5000;

// let tax = income * (10/100);
// let afterTax = income - tax;
// var rent = 2000;
// var groceries = 3000;
// var transport = 2000;
// var entertainment = 5000;

// var expense = 2300;
// var remainBalance = afterTax - expense;
// var saving = remainBalance * (20/100);

// console.log('Name is : ' + name);
// console.log('Income: $: ' + income);
// console.log('tax : $' + tax);
// console.log('expense : $' + expense);
// console.log('remain : $' + remainBalance);
// console.log('saving : $' + saving);

// phase 4
const name = 'Juyel';
const income = 5000;

let tax = income * (10/100);
let afterTax = income - tax;

var totalExpense = parseInt(prompt('Total Expense in this month'));

var expense = 0;
for(let i = 1 ; i <= totalExpense; i++){
     let amount = parseInt(prompt('Enter Total Amount:'));
     expense += amount;
}

// var rent = 2000;
// var groceries = 3000;
// var transport = 2000;
// var entertainment = 5000;

// var expense = 2000;
var remainBalance = afterTax - expense;
var saving = remainBalance * (20/100);

console.log('Name is : ' + name);
console.log('Income: $: ' + income);
console.log('tax : $' + tax);
console.log('expense : $' + expense);
console.log('remain : $' + remainBalance);
console.log('saving : $' + saving);

if(saving >= 1000){
     console.log('Excellent');
}else if(saving <= 999 && saving >= 500){
     console.log('Good');
}else if(saving <= 499 && saving >= 100){
     console.log('Needs Improvement');
}else if(saving < 100){
     console.log('Critical');
}

let overSpending = '';

if(afterTax < expense){
     overSpending = 'You are trying to spent more than income';
}

if(overSpending){
     
     console.log(overSpending);
}