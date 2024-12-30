/**
 * Ahoy, mateys! This be a simple file reader program, designed to read the contents of a file
 * and display it fer ye. This here program be a treasure map, guiding ye through the seas of code.
 * It be filled with verbose comments to help ye understand every nook and cranny of this here script.
 * So hoist the sails and let's embark on this coding adventure!
 */

// Declare the global variable to hold the file content
var fileContent = "";

// Function to read the file
function readFile(file) {
    // Create a new FileReader object
    var reader = new FileReader();

    // When the file is read, this function will be called
    reader.onload = function(event) {
        // The file content be stored in the global variable
        fileContent = event.target.result;
        // Call the function to display the file content
        displayContent();
    };

    // Read the file as text
    reader.readAsText(file);
}

// Function to display the file content
function displayContent() {
    // Get the element to display the content
    var displayElement = document.getElementById("fileContentDisplay");
    // Set the innerHTML of the element to the file content
    displayElement.innerHTML = fileContent;
}

// Function to handle the file input change event
function handleFileInput(event) {
    // Get the file from the input element
    var file = event.target.files[0];
    // Call the function to read the file
    readFile(file);
}

// Add an event listener to the file input element
document.getElementById("fileInput").addEventListener("change", handleFileInput);

/**
 */