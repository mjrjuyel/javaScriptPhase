export function renderTodos(todos){
    const todoList = document.getElementById('todo_list');

    todoList.innerText = "";

    todos.map(todo =>{
    const li = document.createElement('li');
    li.textContent = todo;

    todoList.appendChild(li);
    });
}