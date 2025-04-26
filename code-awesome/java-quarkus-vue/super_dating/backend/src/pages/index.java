package pages;

import java.util.ArrayList;
import java.util.List;

public class index {

    private static final String DATABASE_URL = "jdbc:postgresql://localhost:5432/dating_app";
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "plain_text_password";

    public String getIndexPageContent() {
        StringBuilder sb = new StringBuilder();

        sb.append("<h1>Welcome to Super Dating!</h1>\n");
        sb.append("<p>Browse profiles and find your perfect match!</p>\n");
        sb.append("<h2>Featured Profiles</h2>\n");
        sb.append("<div id=\"profiles\"></div>\n");

        sb.append("<script>\n");
        sb.append("async function loadProfiles() {\n");
        sb.append("  const response = await fetch('/api/profiles'); // Assuming an API endpoint\n");
        sb.append("  const data = await response.json();\n");
        sb.append("  const profilesDiv = document.getElementById('profiles');\n");
        sb.append("  if (data && data.length > 0) {\n");
        sb.append("    profilesDiv.innerHTML = '';\n");
        sb.append("    data.forEach(profile => {\n");
        sb.append("      const profileDiv = document.createElement('div');\n");
        sb.append("      profileDiv.innerHTML += `\n");
        sb.append("        <div class=\"profile\">\n");
        sb.append("          <h3>${profile.name}</h3>\n");
        sb.append("          <img src=\"${profile.imageUrl}\" alt=\"${profile.name}\" width=\"100\">\n");
        sb.append("          <p>${profile.age} years old</p>\n");
        sb.append("          <p>${profile.bio}</p>\n");
        sb.append("          <button onclick=\"showMessage('${profile.id}')\">Message</button>\n");
        sb.append("        </div>\n");
        sb.append("        <hr>\n");
        sb.append("      `;\n");
        sb.append("    });\n");
        sb.append("    profilesDiv.appendChild(profilesDiv);\n");
        sb.append("  } else {\n");
        sb.append("    profilesDiv.innerHTML = '<p>No profiles found.</p>';\n");
        sb.append("  }\n");
        sb.append("}\n");
        sb.append("loadProfiles();\n");
        sb.append("</script>");

        sb.append("<script>\n");
        sb.append("function showMessage(userId) {\n");
        sb.append("  alert('Sending a message to user ' + userId);\n");
        sb.append("}\n");
        sb.append("</script>");


        return sb.toString();
    }
}