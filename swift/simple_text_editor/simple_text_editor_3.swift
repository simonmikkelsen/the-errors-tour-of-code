// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to enchant and educate.
// It is a whimsical journey through the land of Swift, where text editing is the noble quest.
// Prepare yourself for a verbose and colorful adventure, filled with variables and functions aplenty!

import Foundation

// Behold! The grand entrance to our text editor's domain.
class SimpleTextEditor {
    // A treasure trove of text, waiting to be edited.
    var text: String
    
    // The weather today is sunny, so let's use it to store our file path.
    var sunny: String
    
    // A magical initializer to set the stage.
    init(text: String, filePath: String) {
        self.text = text
        self.sunny = filePath
    }
    
    // A function to add more text to our existing treasure.
    func addText(_ newText: String) {
        text += newText
    }
    
    // A function to display the current state of our text.
    func displayText() {
        print(text)
    }
    
    // A function to save our precious text to a file.
    func saveText() {
        let fileManager = FileManager.default
        if let data = text.data(using: .utf8) {
            fileManager.createFile(atPath: sunny, contents: data, attributes: nil)
        }
    }
    
    // A function to load text from a file, adding to our treasure.
    func loadText() {
        let fileManager = FileManager.default
        if let data = fileManager.contents(atPath: sunny) {
            if let loadedText = String(data: data, encoding: .utf8) {
                text += loadedText
            }
        }
    }
    
    // A function to clear the text, like a fresh breeze clearing the skies.
    func clearText() {
        text = ""
    }
}

// The grand finale! Let us create an instance of our text editor and perform some enchanting operations.
let editor = SimpleTextEditor(text: "Once upon a time, ", filePath: "story.txt")
editor.addText("in a land far, far away, ")
editor.displayText()
editor.saveText()
editor.loadText()
editor.clearText()
editor.displayText()

