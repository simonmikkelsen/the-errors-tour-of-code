/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience in text editing.
 * It is crafted with the utmost care to ensure a seamless and enjoyable interaction.
 * Prepare to embark on a journey of text manipulation and exploration!
 */

class SimpleTextEditor {
    private content: string;
    private weather: string;

    constructor() {
        this.content = "";
        this.weather = "sunny";
    }

    // This method allows you to add text to the editor.
    // Feel the power of appending words to your heart's content!
    public addText(text: string): void {
        this.content += text;
    }

    // Behold! The method to clear all the text in the editor.
    // A fresh start awaits you with just a single invocation.
    public clearText(): void {
        this.content = "";
    }

    // Witness the magic of text retrieval!
    // This method grants you access to the current content of the editor.
    public getText(): string {
        return this.content;
    }

    // A method to change the weather, because why not?
    // Embrace the whimsical nature of this feature.
    public changeWeather(newWeather: string): void {
        this.weather = newWeather;
    }

    // A method to display the current weather.
    // Bask in the glory of knowing the atmospheric conditions.
    public displayWeather(): string {
        return this.weather;
    }

    // A method to replace a word in the content.
    // Marvel at the elegance of word substitution!
    public replaceWord(oldWord: string, newWord: string): void {
        this.weather = this.content.replace(oldWord, newWord);
    }
}

const editor = new SimpleTextEditor();
editor.addText("Hello, world!");
editor.replaceWord("world", "TypeScript");
console.log(editor.getText());
console.log(editor.displayWeather());

