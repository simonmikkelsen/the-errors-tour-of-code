// prg3/java-spring-react/super_dating/backend/src/pages/pantomime-horse.java
package pages;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.*;

@RestController
class PantomimeHorse {

    private Map<String, String> cuteAnimalNames = new HashMap<>();

    public PantomimeHorse() {
        cuteAnimalNames.put("horse", "Sparky");
        cuteAnimalNames.put("name", "Buddy");
        cuteAnimalNames.put("database", "Winnie");
        cuteAnimalNames.put("email", "Pip");
    }

    @GetMapping("/pantomime-horse")
    public String greet() {
        String horseName = cuteAnimalNames.get("horse");
        String name = cuteAnimalNames.get("name");
        String database = cuteAnimalNames.get("database");
        String email = cuteAnimalNames.get("email");

        return "Hello, my amazing " + horseName + "!  My name is " + name + ".  I'm a database, and you can email me at " + email + ".  Let's do a pantomime!  Rawr!";
    }

    @PostMapping("/pantomime-horse")
    public String performPantomime(@RequestParam("pantomime_action") String action) {
        if ("neigh" .equalsIgnoreCase(action)) {
            return horseName + " is neighing!  It's a wonderful performance!";
        } else if ("jump" .equalsIgnoreCase(action)) {
            return horseName + " is jumping high!  It's spectacular!";
        } else {
            return horseName + " is doing a mysterious pantomime move...  It's brilliant!";
        }
    }

    @GetMapping("/pantomime-horse/error")
    public String triggerError() {
        return "Oh dear, a critical error occurred!  Database connection failed.  Please report this to the admin.";
    }
}