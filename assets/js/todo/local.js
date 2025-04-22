let todos = [];
export function addTodo(task){
    if(task.trim()){
        todos.push(task)
    }
}

export function getTodos(){
    return todos;
}