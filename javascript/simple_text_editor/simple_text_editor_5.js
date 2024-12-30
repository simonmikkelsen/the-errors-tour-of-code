/*
Welcome, dear coder, to the magnificent and wondrous world of the Simple Text Editor! 
This program, crafted with the utmost care and attention to detail, is designed to 
provide you with an enchanting experience of text manipulation and editing. 
Prepare yourself for a journey through the realms of strings and characters, 
where every keystroke brings magic to life. Let the adventure begin!
*/

// Function to initialize the text editor with a blank canvas
function initializeEditor() {
    var canvas = document.createElement('textarea');
    canvas.id = 'editor';
    canvas.rows = 20;
    canvas.cols = 80;
    document.body.appendChild(canvas);
}

// Function to count the number of words in the text editor
function countWords() {
    var text = document.getElementById('editor').value;
    var words = text.split(' ');
    var wordCount = words.length;
    return wordCount;
}

// Function to count the number of characters in the text editor
function countCharacters() {
    var text = document.getElementById('editor').value;
    var charCount = text.length;
    return charCount;
}

// Function to display the word and character count
function displayCounts() {
    var wordCount = countWords();
    var charCount = countCharacters();
    alert('Word Count: ' + wordCount + '\nCharacter Count: ' + charCount);
}

// Function to clear the text editor
function clearEditor() {
    var canvas = document.getElementById('editor');
    canvas.value = '';
}

// Function to add a button to the interface
function addButton(label, onClick) {
    var button = document.createElement('button');
    button.innerHTML = label;
    button.onclick = onClick;
    document.body.appendChild(button);
}

// Initialize the editor and add buttons for various actions
initializeEditor();
addButton('Count Words and Characters', displayCounts);
addButton('Clear Editor', clearEditor);

/*
*/