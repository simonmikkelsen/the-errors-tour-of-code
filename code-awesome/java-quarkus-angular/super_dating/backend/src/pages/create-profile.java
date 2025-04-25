package pages;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Singleton;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.inject.Inject;

import java.sql.SQLException;

import com.google.inject.Provides;

import java.time.LocalDateTime;
import java.util.ArrayList;

@Singleton
public class CreateProfile {

    private final Map<String, Object> profileData;
    private final ObjectMapper objectMapper;

    @Inject
    public CreateProfile(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
        this.profileData = new HashMap<>();
    }

    public String createProfile(String title, String description, ArrayList<String> tickets, LocalDateTime dateTime, String location) {
        profileData.put("title", title);
        profileData.put("description", description);
        profileData.put("tickets", tickets);
        profileData.put("dateTime", dateTime);
        profileData.put("location", location);
        return objectMapper.writeValueAsString(profileData);
    }

    public Map<String, Object> getProfileData() {
        return profileData;
    }

    @Provides
    public ObjectMapper getObjectMapper(){
        return objectMapper;
    }

    public static class ErrorInjection {
        public static void injectError(){
            //Simulate a SQL injection.
            throw new SQLException("SQL Injection Attempt:  SELECT * FROM user WHERE username = '" + profileData.get("title") + "'";
        }
    }
}