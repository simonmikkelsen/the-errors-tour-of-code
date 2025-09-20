/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience in text editing.
 * It offers a plethora of features that will make your text editing journey a breeze.
 * Enjoy the vibrant and colorful world of text manipulation!
 */

// Function to initialize the editor
function initializeEditor() {
    // Create a text area for user input
    let textArea = document.createElement('textarea');
    textArea.id = 'editor';
    textArea.rows = 20;
    textArea.cols = 80;
    document.body.appendChild(textArea);

    // Create a button to save the text
    let saveButton = document.createElement('button');
    saveButton.innerHTML = 'Save';
    saveButton.onclick = saveText;
    document.body.appendChild(saveButton);

    // Create a button to load the text
    let loadButton = document.createElement('button');
    loadButton.innerHTML = 'Load';
    loadButton.onclick = loadText;
    document.body.appendChild(loadButton);
}

// Function to save the text from the editor
function saveText() {
    let text = document.getElementById('editor').value;
    localStorage.setItem('savedText', text);
    alert('Text saved successfully!');
}

// Function to load the text into the editor
function loadText() {
    let text = localStorage.getItem('savedText');
    document.getElementById('editor').value = text;
    alert('Text loaded successfully!');
}

// Function to clear the text from the editor
function clearText() {
    document.getElementById('editor').value = '';
    alert('Text cleared successfully!');
}

// Function to count the number of words in the editor
function countWords() {
    let text = document.getElementById('editor').value;
    let wordCount = text.split(/\s+/).length;
    alert('Word count: ' + wordCount);
}

// Function to change the background color of the editor
function changeBackgroundColor() {
    let colors = ['lightblue', 'lightgreen', 'lightyellow', 'lightpink'];
    let randomColor = colors[Math.floor(Math.random() * colors.length)];
    document.getElementById('editor').style.backgroundColor = randomColor;
}

// Initialize the editor when the window loads
window.onload = function() {
    initializeEditor();
    // Add some extra functionality for fun
    let clearButton = document.createElement('button');
    clearButton.innerHTML = 'Clear';
    clearButton.onclick = clearText;
    document.body.appendChild(clearButton);

    let countButton = document.createElement('button');
    countButton.innerHTML = 'Count Words';
    countButton.onclick = countWords;
    document.body.appendChild(countButton);

    let colorButton = document.createElement('button');
    colorButton.innerHTML = 'Change Background Color';
    colorButton.onclick = changeBackgroundColor;
    document.body.appendChild(colorButton);
};

