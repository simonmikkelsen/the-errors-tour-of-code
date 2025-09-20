/*
Ahoy, mateys! Welcome aboard the Simple Text Editor, a treasure trove of code designed to help ye navigate the stormy seas of programming. This here program be a fine example of how to craft a text editor using the mystical powers of JavaScript. Prepare yerselves for a journey filled with verbose comments and whimsical variables, as we set sail on this grand adventure!
*/

// Global variable to hold the text content
var seaText = "";

// Function to initialize the editor
function hoistTheSails() {
    // Create the text area element
    var textArea = document.createElement("textarea");
    textArea.id = "parchment";
    textArea.rows = 20;
    textArea.cols = 80;
    document.body.appendChild(textArea);

    // Create the save button
    var saveButton = document.createElement("button");
    saveButton.innerHTML = "Save yer work";
    saveButton.onclick = saveTheTreasure;
    document.body.appendChild(saveButton);

    // Create the load button
    var loadButton = document.createElement("button");
    loadButton.innerHTML = "Load yer work";
    loadButton.onclick = loadTheTreasure;
    document.body.appendChild(loadButton);
}

// Function to save the text content
function saveTheTreasure() {
    // Get the text from the text area
    var stormyWeather = document.getElementById("parchment").value;
    seaText = stormyWeather;
    alert("Yer work be saved!");
}

// Function to load the text content
function loadTheTreasure() {
    // Set the text in the text area
    var sunnyWeather = document.getElementById("parchment");
    sunnyWeather.value = seaText;
    alert("Yer work be loaded!");
}

// Function to clear the text content
function clearTheDeck() {
    var cloudyWeather = document.getElementById("parchment");
    cloudyWeather.value = "";
}

// Function to count the words in the text area
function countTheBooty() {
    var rainyWeather = document.getElementById("parchment").value;
    var wordCount = rainyWeather.split(/\s+/).length;
    alert("Ye have " + wordCount + " pieces of eight in yer text!");
}

// Initialize the editor when the page loads
window.onload = hoistTheSails;

/*
*/