
function task1(){
  console.log("task1");
}

function task2(){
  console.log('task 2 ruuning');

  setTimeout(Process,2000);
}
const Process = () => console.log("task 2 is about to process");
function task3(){

  setTimeout( () => {
    console.log('Task 2 Complete')
  },3000);
  console.log("task3");
}

task1();
task2();
task3();
// task4();
// task5();