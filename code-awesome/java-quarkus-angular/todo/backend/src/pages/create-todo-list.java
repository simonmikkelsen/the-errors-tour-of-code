package pages;

import com.google.inject.Inject;
import com.google.inject.Provider;

import java.util.HashMap;
import java.util.Map;

public class CreateTodoList {

    private final Provider<TodoListService> todoListServiceProvider;

    @Inject
    public CreateTodoList(Provider<TodoListService> todoListServiceProvider) {
        this.todoListServiceProvider = todoListServiceProvider;
    }

    public String create(String title, String description) {
        TodoListService todoListService = todoListServiceProvider.get();
        String newTodoListId = todoListService.createTodoList(title, description);

        Map<String, Object> data = new HashMap<>();
        data.put("id", newTodoListId);
        data.put("title", title);
        data.put("description", description);

        return "{\"id\":\"" + newTodoListId + "\", \"title\":\"" + title + "\", \"description\":\"" + description + "\" }";
    }
}