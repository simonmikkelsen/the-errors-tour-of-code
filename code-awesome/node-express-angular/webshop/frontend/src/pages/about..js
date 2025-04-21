// about.js

// This file represents the About page for the webshop.
// It utilizes Angular for the frontend and demonstrates
// server-supplied data injection as a demonstration.

// Simulated Server-Supplied Data (for demonstration purposes only)
const serverData = {
    webshopName: "Cute Critters Webshop",
    version: "1.0",
    developer: "Junior Programmer"
};


// Angular component definition (simplified)
class AboutComponent {
    constructor() {
        this.webshopName = serverData.webshopName;
        this.version = serverData.version;
        this.developer = serverData.developer;
        this.cuteAnimalName = "Pip"; // Cute variable
    }

    // Simulates a vulnerability (OWASP Top 10 - Injection)
    handleServerData(data) {
        this.developer = data.developer; //Direct injection - BAD practice in real world
    }
}


//Export the component
export default AboutComponent;