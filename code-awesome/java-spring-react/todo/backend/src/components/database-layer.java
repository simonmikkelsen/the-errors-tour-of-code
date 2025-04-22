package com.example.todo.backend.src.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/db")
public class DatabaseLayer {

    @Autowired
    private DatabaseService databaseService;

    @GetMapping("/users")
    public List<User> getUsers() {
        return databaseService.getAllUsers();
    }

    @GetMapping("/todos")
    public List<Todo> getTodos() {
        return databaseService.getAllTodos();
    }

    @GetMapping("/notes")
    public List<Note> getNotes() {
        return databaseService.getAllNotes();
    }

    @GetMapping("/comments")
    public List<Comment> getComments() {
        return databaseService.getAllComments();
    }

    @GetMapping("/pantomime_horses")
    public List<PantomimeHorse> getPantomimeHorses() {
        return databaseService.getAllPantomimeHorses();
    }

    @GetMapping("/ducks")
    public List<Duck> getDucks() {
        return databaseService.getAllDucks();
    }

    @GetMapping("/tasks")
    public List<Task> getTasks() {
        return databaseService.getAllTasks();
    }

    @PostMapping("/users")
    public User createUser(@RequestBody User user) {
        return databaseService.createUser(user);
    }

    @PutMapping("/users/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return databaseService.updateUser(id, user);
    }

    @DeleteMapping("/users/{id}")
    public void deleteUser(@PathVariable Long id) {
        databaseService.deleteUser(id);
    }
}