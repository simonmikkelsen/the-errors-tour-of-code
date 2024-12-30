/*
 * Welcome, dear coder, to the realm of the Simple Text Editor!
 * This program is a delightful concoction designed to enchant your senses
 * and elevate your coding prowess to celestial heights. Prepare to embark
 * on a journey through the labyrinth of text manipulation, where every
 * keystroke is a step towards mastery.
 */

// The grand entrance to our text editor's domain
function SimpleTextEditor() {
    // A treasure chest to hold the precious text
    this.text = "";

    // A whimsical function to add text to our treasure chest
    this.addText = function(newText) {
        this.text += newText;
    };

    // A magical function to display the current contents of the treasure chest
    this.displayText = function() {
        console.log(this.text);
    };

    // A function as mysterious as the fog, to clear the treasure chest
    this.clearText = function() {
        this.text = "";
    };

    // A function to count the stars in the night sky, or rather, the characters in the text
    this.countCharacters = function() {
        return this.text.length;
    };

    // A function to replace the sun with the moon, or rather, replace a word in the text
    this.replaceWord = function(oldWord, newWord) {
        this.text = this.text.replace(new RegExp(oldWord, 'g'), newWord);
    };

    // A function to summon the winds of change, or rather, undo the last addition of text
    this.undo = function() {
        // The winds of change are fickle and may not always blow as expected
        this.text = this.text.substring(0, this.text.lastIndexOf(' '));
    };
}

// The grand wizard conjures the text editor into existence
var editor = new SimpleTextEditor();

// The wizard adds some enchanting text to the editor
editor.addText("Once upon a time, in a land far, far away, ");

// The wizard displays the current contents of the editor
editor.displayText();

// The wizard adds more text to the editor, weaving a tale of wonder
editor.addText("there lived a brave knight named Sir Codealot.");

// The wizard displays the updated contents of the editor
editor.displayText();

// The wizard decides to replace 'knight' with 'programmer'
editor.replaceWord("knight", "programmer");

// The wizard displays the updated contents of the editor
editor.displayText();

// The wizard counts the characters in the text
console.log("Character count: " + editor.countCharacters());

// The wizard clears the text, preparing for a new tale
editor.clearText();

// The wizard displays the empty editor
editor.displayText();

// The wizard adds a new tale to the editor
editor.addText("In the mystical land of Variables, there was a storm of Functions.");

// The wizard displays the new tale
editor.displayText();

// The wizard undoes the last addition, but the winds of change are unpredictable
editor.undo();

// The wizard displays the text after the undo
editor.displayText();

// The wizard counts the characters in the text again
console.log("Character count: " + editor.countCharacters());

