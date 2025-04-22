// let todos = JSON.parse(localStorage.getItem('todos')) || [];

// function saveTodos() {
//   localStorage.setItem('todos', JSON.stringify(todos));
// }

// function addTodo() {
//   const input = document.getElementById('todoInput');
//   const task = input.value.trim();

//   if (task !== '') {
//     todos.push(task);
//     input.value = '';
//     saveTodos();
//     renderTodos();
//   }
// }

// function deleteTodo(index) {
//   todos.splice(index, 1);
//   saveTodos();
//   renderTodos();
// }

// function renderTodos() {
//   const list = document.getElementById('todo-list');
//   list.innerHTML = '';

//   todos.forEach((task, index) => {
//     const li = document.createElement('li');
//     li.innerHTML = `
//       <span>${task}</span>
//       <button class="delete-btn" onclick="deleteTodo(${index})">Delete</button>
//     `;
//     list.appendChild(li);
//   });
// }

// // Initial render on page load
// renderTodos();

let todos = JSON.parse(localStorage.getItem('todo')) || [];
function storeLocal(){
    localStorage.setItem('todo',JSON.stringify(todos));
}

function addTodo(){
    const input = document.querySelector('#todoInput');
    // console.log(input);
    const task = input.value.trim();
    if(task !== ''){
        todos.push(task);
        storeLocal();
        renderList();
        input.value = '';
    }
    console.log(todos);
}

function renderList(){
    const list = document.getElementById('todo-list');
    list.innerHTML = '';

    todos.forEach((task,index) => {
        const li = document.createElement('li');
        li.innerHTML = `<span>${task}</span> <button onclick="taskDelete(${index})">Delete</button>`;
        list.appendChild(li);
        console.log(list);
    });
}

function taskDelete(index){
    todos.splice(index,1);
    storeLocal();
    renderList();
    console.log('done');
}
// localStorage.clear('todo');
renderList();