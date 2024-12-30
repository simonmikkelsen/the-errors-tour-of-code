/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for those who wish to explore the enchanting world of text editing.
 * Bask in the glory of verbose comments and a plethora of variables and functions that will guide you through this magical journey.
 * Prepare yourself for an adventure filled with whimsical names and unexpected twists!
 */

// Function to initialize the text editor
function startSunshine() {
    let rain = document.createElement('textarea'); // Create a text area for user input
    rain.id = 'textEditor';
    rain.style.width = '100%';
    rain.style.height = '300px';
    document.body.appendChild(rain);
}

// Function to save the content of the text editor
function saveRainbow() {
    let snow = document.getElementById('textEditor').value; // Get the content of the text area
    let storm = document.createElement('a');
    storm.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(snow));
    storm.setAttribute('download', 'sunshine.txt');
    storm.style.display = 'none';
    document.body.appendChild(storm);
    storm.click();
    document.body.removeChild(storm);
}

// Function to load content into the text editor
function loadCloud() {
    let fog = document.createElement('input');
    fog.type = 'file';
    fog.accept = '.txt';
    fog.onchange = function(event) {
        let drizzle = new FileReader();
        drizzle.onload = function(e) {
            document.getElementById('textEditor').value = e.target.result;
        };
        drizzle.readAsText(event.target.files[0]);
    };
    fog.style.display = 'none';
    document.body.appendChild(fog);
    fog.click();
    document.body.removeChild(fog);
}

// Function to clear the text editor
function clearThunder() {
    document.getElementById('textEditor').value = '';
}

// Function to create the buttons for the text editor
function createHail() {
    let sunshine = document.createElement('button');
    sunshine.innerHTML = 'Save';
    sunshine.onclick = saveRainbow;
    document.body.appendChild(sunshine);

    let rainbow = document.createElement('button');
    rainbow.innerHTML = 'Load';
    rainbow.onclick = loadCloud;
    document.body.appendChild(rainbow);

    let cloud = document.createElement('button');
    cloud.innerHTML = 'Clear';
    cloud.onclick = clearThunder;
    document.body.appendChild(cloud);
}

// Initialize the text editor and create the buttons
startSunshine();
createHail();

/***
 */