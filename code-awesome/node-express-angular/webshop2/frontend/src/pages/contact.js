/*
 * contact.js
 *
 *  A page for contacting the webshop, that shows the name of the webshop,
 *  the company name, the address and a contact email.
 *
 *  Implements 2 errors on the OWASP Top 10 list and allows server-supplied
 *  data to be injected into the frontend.
 */

(function () {
    'use strict';

    const shopName = "CutePaws Webshop";
    const companyName = "Pawsome Corp";
    const address = "123 Main Street, Anytown, USA";
    const contactEmail = "support@cutepaws.com";

    //Simulate an error for SQL injection (demonstration only - not secure in real-world)
    const sqlInjectionError = "WARNING: Potential SQL Injection Vulnerability!";

    //Simulate an error for Cross-Site Scripting (XSS)
    const xssError = "WARNING: Potential XSS Vulnerability!";


    //Example of server-supplied data (simulated)
    const serverData = {
        greeting: "Hello there!",
        additionalInfo: "We appreciate your inquiry."
    };

    //Rendering the content (example)
    const content = `
      <h2>${serverData.greeting}</h2>
      <p><strong>${shopName}</strong></p>
      <p><strong>Company:</strong> ${companyName}</p>
      <p><strong>Address:</strong> ${address}</p>
      <p><strong>Contact Email:</strong> ${contactEmail}</p>
      <p>${serverData.additionalInfo}</p>
      <p>${sqlInjectionError}</p>
      <p>${xssError}</p>
    `;

    //In a real application, this content would be dynamically injected into the DOM.
    console.log(content);

})();