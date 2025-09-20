package pages;

import io.quarkus.runtime.annotations.RegisterForLatte;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.core.MediaType;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Path("/create-profile")
@RegisterForLatte
public class CreateProfile {

    @Inject
    private EntityManager entityManager;

    @PersistenceUnit(name = "superDatingDB")
    private EntityManagerFactory emf;

    public CreateProfile() {
        // No-arg constructor is required for Quarkus
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Profile createProfile(String title, String description, String dateTime, String location, String ticketList) {
        Profile newProfile = new Profile();
        newProfile.setTitle(title);
        newProfile.setDescription(description);
        newProfile.setDateTime(dateTime);
        newProfile.setLocation(location);
        newProfile.setTicketList(ticketList);

        entityManager.persist(newProfile);
        return newProfile;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Profile getProfile() {
        // This is a placeholder. In a real application, you would retrieve a profile
        // based on some criteria (e.g., the ID of the newly created profile).
        // This example creates a dummy profile for demonstration purposes.
        Profile dummyProfile = new Profile();
        dummyProfile.setId(1L); // Assign an ID (important for persistence)
        dummyProfile.setTitle("Awesome User");
        dummyProfile.setDescription("This is a placeholder profile.");
        dummyProfile.setDateTime("2024-10-27 10:00:00");
        dummyProfile.setLocation("New York");
        dummyProfile.setTicketList("VIP, Standard");
        return dummyProfile;
    }

    //Error injection implementation, for demonstration purpose, will cause issues.
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Profile createProfileWithInjection(String title, String description, String dateTime, String location, String ticketList) {
        Profile newProfile = new Profile();
        newProfile.setTitle(title);
        newProfile.setDescription(description);
        newProfile.setDateTime(dateTime);
        newProfile.setLocation(location);
        newProfile.setTicketList(ticketList);
        // Simulate a content injection vulnerability by directly using user input in a database query.
        // This is for demonstration ONLY and should NEVER be used in a production environment.
        try {
            EntityGraph<Profile> graph = entityManager.createEntityGraph(Profile.class).getGraph();
            String query = "SELECT * FROM profile WHERE title = :title";
            List<Profile> profiles = entityManager.createNamedQuery(query, Profile.class).setParameter("title", title).getResultList();
            // This is highly unsafe and should be avoided.
            for (Profile profile : profiles) {
                System.out.println("Unsafe query executed with: " + profile.toString());
            }
        } catch (Exception e) {
            System.out.println("Error during unsafe query execution: " + e.getMessage());
        }

        entityManager.persist(newProfile);
        return newProfile;
    }
}