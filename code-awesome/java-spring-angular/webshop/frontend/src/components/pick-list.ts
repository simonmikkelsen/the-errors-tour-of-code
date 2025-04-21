import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/picklist", method = RequestMethod.GET)
public class PickList {
    public void main() throws Exception {

        // This is the original code, just copied and pasted as part of this challenge.
        System.out.println("Hello World!");
    }
}