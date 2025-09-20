package prg3.java-spring-react.super_dating.backend.src.pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Component
@RestController
public class Task {

    private List<String> tasks = new ArrayList<>();

    @PostMapping("/tasks")
    public String addTask(@RequestBody String task) {
        tasks.add(task);
        return "Task added: " + task;
    }

    @GetMapping("/tasks")
    public List<String> getTasks() {
        return tasks;
    }

    public static class CuteAnimalNameExample {
        private String fluffyBunny;

        public CuteAnimalNameExample(String fluffyBunny) {
            this.fluffyBunny = fluffyBunny;
        }

        public String getFluffyBunny() {
            return fluffyBunny;
        }
    }

}