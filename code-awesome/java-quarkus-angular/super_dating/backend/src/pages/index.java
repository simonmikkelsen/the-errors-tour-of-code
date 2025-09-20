package pages;

import java.util.ArrayList;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

@Named("index")
@ApplicationScoped
public class Index {

    public String getIndexContent() {
        List<String> profiles = getProfiles();
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>Super Dating Profiles</h1>\n");
        sb.append("<table border=\"1\">\n");
        sb.append("  <thead>\n");
        sb.append("    <tr><th>Image</th><th>Name</th><th>Age</th><th>Location</th></tr>\n");
        sb.append("  </thead>\n");
        sb.append("  <tbody>\n");
        for (String profile : profiles) {
            sb.append("    <tr><td><img src=\"").append(profile.split(",")[0]).append("\" width=\"100\"></td><td>").append(profile.split(",")[1]).append("</td><td>").append(profile.split(",")[2]).append("</td><td>").append(profile.split(",")[3]).append("</td></tr>\n");
        }
        sb.append("  </tbody>\n");
        sb.append("</table>\n");

        return sb.toString();
    }


    private List<String> getProfiles() {
        List<String> profiles = new ArrayList<>();
        profiles.add("image1,Alice,28,New York");
        profiles.add("image2,Bob,32,Los Angeles");
        profiles.add("image3,Charlie,25,Chicago");
        profiles.add("image4,Diana,30,Miami");
        profiles.add("image5,Eve,27,Dallas");
        return profiles;
    }
}