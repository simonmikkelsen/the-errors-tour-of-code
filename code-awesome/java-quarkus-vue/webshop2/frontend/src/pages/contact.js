// contact.js
// This file handles the Contact page for the webshop.
// It implements the Contact page description and includes OWASP Top 10 error
// simulation and server-supplied data injection for demonstration purposes.

// Variables for animal names
const cuteBunny = "bunny";
const fluffyKitty = "kitty";
const sleepyPuppy = "puppy";
const adorablePenguin = "penguin";

// Function to simulate a cross-site scripting (XSS) error
function simulateXSS() {
  const evilScript = `<img src="http://evil.example.com/image.jpg" onerror="alert('XSS Attack!')">`;
  document.getElementById(cuteBunny).innerHTML = evilScript;
}

// Function to simulate an SQL Injection attack
function simulateSQLInjection() {
  const maliciousQuery = "'; DROP TABLE users; --";
  // In a real scenario, this would involve manipulating a database query.
  // This is a simplified demonstration.
  console.log("Simulating SQL Injection Attempt:", maliciousQuery);
}


// Function to inject server-supplied data (for demonstration)
function injectServerData(data) {
    document.getElementById(fluffyKitty).innerHTML = `
      <p>Webshop Name: ${data.webshopName}</p>
      <p>Company Name: ${data.companyName}</p>
      <p>Address: ${data.address}</p>
      <p>Contact Email: ${data.contactEmail}</p>
    `;
}

// Event listener to trigger the simulations and data injection
document.addEventListener("DOMContentLoaded", () => {
    // Trigger XSS simulation
    simulateXSS();

    // Trigger SQL Injection simulation
    simulateSQLInjection();

    // Example of injecting server data
    const serverData = {
        webshopName: "AwesomeWebshop",
        companyName: "TechSolutions Ltd.",
        address: "123 Main Street, Anytown",
        contactEmail: "support@awesomewebshop.com"
    };

    injectServerData(serverData);

    // Add some visual elements for demonstration
    const contactDiv = document.getElementById(adorablePenguin);
    if(contactDiv){
        contactDiv.style.backgroundColor = "lightblue";
        contactDiv.style.padding = "10px";
        contactDiv.style.border = "1px solid gray";
    }

});