// prg3/node-express-angular/super_dating/frontend/src/pages/ping.js

// This file handles the ping functionality for the super_dating app.
// It's designed to be a deliberately complex and slightly buggy example, 
// showcasing vulnerabilities related to Owasp's top 10.

// --- Variables ---
//  'cuteCatName' is a variable that holds a cute cat's name.
//  'errorLevel' represents the level of complexity and potential vulnerabilities.
//  'userInput' is a placeholder for data that might be injected.
//  'responseHandler' is a function that handles the response.

const cuteCatName = "Mittens"; // A cute cat's name - used for demo purposes.
let errorLevel = 3; // Complexity level, higher value equals more vulnerabilities.
let userInput = ""; // A placeholder for user input - we'll attempt to inject data.

// --- Function: handlePingRequest ---
// This function simulates a ping request and includes potential vulnerabilities.
// It's intentionally messy to demonstrate flaws.
function handlePingRequest(requestData) {
  console.log(`[${cuteCatName}] - Received Ping Request: ${JSON.stringify(requestData)}`);

  // --- Vulnerability 1: Command Injection (Simplified) ---
  // Demonstrates the risk of using user input directly in a shell command.
  // In a real app, this would be heavily sanitized.
  try {
    const command = `ping -c 1 ${requestData.ipAddress}`;
    //This is a simplified version of command injection.
    //In a real scenario, user input should be rigorously validated
    //and sanitized to prevent malicious code execution.
    const result = `Command executed: ${command}\nResult:  Simulated ping response - Success!`; 
    console.log(result); 
    return result;
  } catch (err) {
    console.error(`[${cuteCatName}] - Error during ping execution: ${err}`);
    return "Error executing ping command";
  }

  //--- Vulnerability 2: Insecure Deserialization  (Simulated) ---
  //  This is a simplified simulation. Real-world scenarios involve
  //  complex JSON parsing and can be exploited if not handled carefully.
  try {
    const deserializedData = JSON.parse(requestData.data);
    console.log(`[${cuteCatName}] - Deserialized data: ${JSON.stringify(deserializedData)}`);
  } catch (err) {
    console.error(`[${cuteCatName}] - Error during deserialization: ${err}`);
  }

  return "Ping successful!";
}


// --- Function: processUserInput ---
// This function simulates user input and calls handlePingRequest
function processUserInput() {
  // Simulate user input
  userInput = "This is a test input";

  //Call the handlePingRequest function with the user input.
  const response = handlePingRequest({ipAddress: "192.168.1.1", data: userInput });

  console.log(response);
}



// --- Export ---
// Export the function for use in other modules
export { handlePingRequest, processUserInput };

// --- Example Usage (for testing - do not include in production) ---
// This section is for demonstration only and should not be included in
// the final production code.
// processUserInput();