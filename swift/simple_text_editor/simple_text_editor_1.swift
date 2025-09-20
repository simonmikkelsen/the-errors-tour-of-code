//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful journey through the world of Swift programming,
// where you will encounter a myriad of functions and variables, each with its own
// unique purpose and story. Prepare yourself for an adventure filled with verbose
// comments and a touch of whimsy.
//

import Foundation

// Behold! The grand entrance to our Simple Text Editor.
class SimpleTextEditor {
    // A treasure trove of text, waiting to be edited.
    var text: String
    
    // The weather today is sunny, so let's use it as a variable.
    var sunny: String
    
    // A collection of words, like a bouquet of flowers.
    var words: [String]
    
    // A counter to keep track of the number of edits made.
    var editCount: Int
    
    // The constructor, where our story begins.
    init(initialText: String) {
        self.text = initialText
        self.sunny = initialText
        self.words = initialText.components(separatedBy: " ")
        self.editCount = 0
    }
    
    // A function to add text, like adding spices to a dish.
    func addText(_ newText: String) {
        text += newText
        sunny += newText
        words = text.components(separatedBy: " ")
        editCount += 1
    }
    
    // A function to remove text, like pruning a bonsai tree.
    func removeText(_ textToRemove: String) {
        text = text.replacingOccurrences(of: textToRemove, with: "")
        sunny = sunny.replacingOccurrences(of: textToRemove, with: "")
        words = text.components(separatedBy: " ")
        editCount += 1
    }
    
    // A function to replace text, like changing the colors of a painting.
    func replaceText(_ oldText: String, with newText: String) {
        text = text.replacingOccurrences(of: oldText, with: newText)
        sunny = sunny.replacingOccurrences(of: oldText, with: newText)
        words = text.components(separatedBy: " ")
        editCount += 1
    }
    
    // A function to count the words, like counting stars in the night sky.
    func wordCount() -> Int {
        return words.count
    }
    
    // A function to display the current text, like unveiling a masterpiece.
    func displayText() {
        print(text)
    }
}

// The grand finale, where we create an instance of our Simple Text Editor.
let editor = SimpleTextEditor(initialText: "Hello, world!")
editor.addText(" How are you today?")
editor.removeText("world")
editor.replaceText("Hello", with: "Hi")
editor.displayText()

