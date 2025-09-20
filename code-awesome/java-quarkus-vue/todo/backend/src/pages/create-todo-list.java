package pages;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.quarkus.runtime.annotations.RegisterForBatch;

@RegisterForBatch
public class CreateTodoList {

    @JsonIgnore
    private String maliciousInput;

    public String getMaliciousInput() {
        return maliciousInput;
    }

    public void setMaliciousInput(String maliciousInput) {
        this.maliciousInput = maliciousInput;
    }

    private String title;
    private String description;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}