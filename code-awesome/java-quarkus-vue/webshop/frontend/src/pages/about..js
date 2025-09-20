// about.js
// This file represents the 'About' page for the webshop.
// It demonstrates a simple webshop application with JWT authentication
// and incorporates vulnerabilities for demonstration purposes.

// This page intentionally implements two OWASP Top 10 vulnerabilities:
// 1. Cross-Site Scripting (XSS)
// 2. Server-Side Template Injection (SSTI)

// Variables mimicking user data (server-supplied data injection)
const serverData = {
    appName: "Webshop Demo",
    version: "1.0",
    templateEngine: "Velocity",
    //Simulated XSS payload
    xssPayload: "<script>alert('XSS')</script>"
};

// Function to display the "About" page content
function displayAboutContent() {
    console.log(`About Page: ${serverData.appName} - Version ${serverData.version}`);
    console.log("This application is vulnerable to XSS and SSTI.");
    console.log("Warning: Do not trust server-supplied data.");
    console.log(serverData.xssPayload);  // Demonstrates Server-Side Template Injection (SSTI)
}

// Call the display function
displayAboutContent();

// Additional (simulated) logic to demonstrate SSTI - carefully controlled!
function executeTemplate(template) {
    //In a real application, this would parse and execute the template,
    //but here it's just a placeholder to illustrate the concept.

    console.log("Executing template:", template); //Simulate execution
}

//Example - ONLY if you want to demonstrate SSTI, USE CAUTION!
//executeTemplate("<h1>Welcome to the Webshop!</h1> <script>alert('SSTI')</script>");