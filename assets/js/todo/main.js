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

function addItem(){
    localStorage.setItem('todo',JSON.stringify(todos))
}
console.log(todos);
function addTodo(){
    const input = document.getElementById('todoInput');
    let  task = input.value.trim();
    if(task != ''){
        todos.push(task);
        addItem();
        renderItem();
        console.log(todos);
        input.value = '';
    }
}

function renderItem(){
    const todolist = document.getElementById('todo-list');
    todolist.innerHTML = '';

    todos.forEach((content,index) => {
        const li = document.createElement('li');
        li.innerHTML = `${index + 1} - <span>${content} |</span><button onclick="deleteItem(${index})">Delete</button>`;
        todolist.appendChild(li);
        console.log(li);
    });
}

renderItem();
function deleteItem(index){
    todos.splice(index,1);
    addItem();
    renderItem();
}