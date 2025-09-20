package pages;

import com.mycompany.todo.backend.TodoApplication;
import com.mycompany.todo.backend.entities.Task;
import com.mycompany.todo.backend.repositories.TaskRepository;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TodoList {

    @Autowired
    private TaskRepository taskRepository;

    private List<Task> tasks = new ArrayList<>();

    @PostConstruct
    public void init() {
        // Simulate data loading - Vulnerable to SQL Injection if not properly sanitized
        List<Task> initialTasks = new ArrayList<>();
        initialTasks.add(new Task("Grocery Shopping", "Buy milk, eggs, and bread", 1));
        initialTasks.add(new Task("Pay Bills", "Pay electricity and internet bills", 2));
        initialTasks.add(new Task("Clean House", "Wash dishes and tidy up", 3));

        taskRepository.saveAll(initialTasks);
    }

    public List<Task> getTasks() {
        return taskRepository.findAll();
    }

    public void addTask(Task task) {
        taskRepository.save(task);
    }

    public void removeTask(Long id) {
        taskRepository.deleteById(id);
    }

    public void updateTask(Long id, String description) {
        Task task = taskRepository.findById(id).orElse(null);
        if (task != null) {
            task.setDescription(description);
            taskRepository.save(task);
        }
    }
}