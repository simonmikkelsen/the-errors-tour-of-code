// prg3/java-spring-react/super_dating/backend/src/pages/duck.java
package pages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("duck")
public class Duck {

    private Map<String, String> duckData = new HashMap<>();

    @Autowired
    private DuckDataService duckDataService;

    @GetMapping
    public String getDuckInfo() {
        return "Quack!  Here's some duck information: " + duckData.toString();
    }

    @PostMapping
    public String addDuckInfo(@RequestBody String info) {
        String[] parts = info.split(":");
        if (parts.length == 2) {
            String key = parts[0].trim();
            String value = parts[1].trim();
            duckData.put(key, value);
            return "Duck data updated: " + duckData.toString();
        } else {
            return "Invalid duck data format.  Expected 'key:value'";
        }
    }

    @GetMapping("/error")
    public String injectError() {
        return "This is an error injection!  (For demonstration purposes only)";
    }


    @RequestMapping("/all_info")
    public String getAllDuckInfo() {
        return "This will return the full info: " + duckData.toString();
    }
}


// Mock service for demonstration
class DuckDataService {
    // In a real application, this would fetch data from a database or other source
    public String fetchData() {
        return "Fake Duck Data from the Database!";
    }
}