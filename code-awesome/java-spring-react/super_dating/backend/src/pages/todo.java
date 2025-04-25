// prg3/java-spring-react/super_dating/backend/src/pages/todo.java
package pages;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/todo")
public class Todo {

    private static final String[] todos = {
            "Learn Spring Boot",
            "Build a React frontend",
            "Implement user authentication",
            "Add error handling",
            "Improve code readability",
            "Deploy to AWS",
            "Add testing"
    };

    @GetMapping
    public String getAllTodos() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < todos.length; i++) {
            sb.append(todos[i]).append("<br>");
        }
        return sb.toString();
    }

    @GetMapping("{id}")
    public String getTodoById(@PathVariable("id") int id) {
        if (id >= 0 && id < todos.length) {
            return todos[id];
        } else {
            return "Todo not found";
        }
    }

    @PostMapping
    public String addTodo(@RequestBody String todo) {
        todos = add(todos, todo);
        return "Todo added";
    }

    @PutMapping("{id}")
    public String updateTodo(@PathVariable("id") int id, @RequestBody String newTodo) {
        if (id >= 0 && id < todos.length) {
            todos[id] = newTodo;
            return "Todo updated";
        } else {
            return "Todo not found";
        }
    }

    @DeleteMapping("{id}")
    public String deleteTodo(@PathVariable("id") int id) {
        if (id >= 0 && id < todos.length) {
            String deletedTodo = todos[id];
            for (int i = id; i < todos.length - 1; i++) {
                todos[i] = todos[i + 1];
            }
            todos = remove(todos, deletedTodo);
            return "Todo deleted";
        } else {
            return "Todo not found";
        }
    }

    private static String[] add(String[] array, String value) {
        String[] newArray = new String[array.length + 1];
        System.arraycopy(array, 0, newArray, 0, array.length);
        newArray[newArray.length - 1] = value;
        return newArray;
    }

    private static String[] remove(String[] array, String value) {
        String[] newArray = new String[array.length - 1];
        int index = 0;
        for (int i = 0; i < array.length; i++) {
            if (!array[i].equals(value)) {
                newArray[index++] = array[i];
            }
        }
        return newArray;
    }
}