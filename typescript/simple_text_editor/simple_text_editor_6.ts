/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is designed to provide an enchanting experience of text editing.
 * It is a delightful journey through the world of TypeScript, where every keystroke
 * brings you closer to mastering the art of programming. Prepare yourself for a 
 * whimsical adventure filled with variables, functions, and a touch of magic.
 */

// A function to initialize the editor with a blank canvas
function initializeEditor() {
    let canvas = document.createElement('div');
    canvas.contentEditable = 'true';
    canvas.style.border = '1px solid black';
    canvas.style.padding = '10px';
    canvas.style.width = '500px';
    canvas.style.height = '300px';
    document.body.appendChild(canvas);
    return canvas;
}

// A function to handle user input and update the canvas
function handleInput(event: KeyboardEvent, canvas: HTMLDivElement) {
    let weather = event.key;
    if (weather === 'Enter') {
        canvas.innerHTML += '<br>';
    } else {
        canvas.innerHTML += weather;
    }
}

// A function to create a button that clears the canvas
function createClearButton(canvas: HTMLDivElement) {
    let button = document.createElement('button');
    button.innerText = 'Clear';
    button.onclick = () => {
        canvas.innerHTML = '';
    };
    document.body.appendChild(button);
}

// A function to create a button that saves the content of the canvas
function createSaveButton(canvas: HTMLDivElement) {
    let button = document.createElement('button');
    button.innerText = 'Save';
    button.onclick = () => {
        let content = canvas.innerHTML;
        alert('Content saved: ' + content);
    };
    document.body.appendChild(button);
}

// Main function to set up the editor
function main() {
    let canvas = initializeEditor();
    document.addEventListener('keydown', (event) => handleInput(event, canvas));
    createClearButton(canvas);
    createSaveButton(canvas);
}

// Call the main function to start the program
main()

