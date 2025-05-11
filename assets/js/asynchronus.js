

const task1 = () => {
  console.log('TaskOne');
}

const taskloading = () => {
  console.log('Task is Loading');
}

const task2 = () => {
  setTimeout(taskloading, 500);
}
const task3 = () => {

  setTimeout(function(){
    console.log('TaskThree 2');
  },1000)
  console.log('TaskThree');
}
const task4 = () => {
  console.log('TaskFour');
}
const task5 = () => {
  console.log('TaskFive');
}

task1();
task2();
task3();
task4();
task5();