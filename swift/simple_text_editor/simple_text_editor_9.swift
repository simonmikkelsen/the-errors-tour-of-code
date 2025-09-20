//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Swift programming.
// Here, you shall encounter a myriad of variables, functions, and whimsical comments that will guide you through the code.
// Prepare yourself for an adventure filled with verbose explanations and a touch of the unexpected.
//

import Foundation

// Behold! The grand entrance to our Simple Text Editor.
class SimpleTextEditor {
    // A treasure trove of text awaits within this variable.
    var textStorage: String = ""
    
    // The sun shines brightly upon this function, illuminating its purpose to add text.
    func addText(newText: String) {
        textStorage += newText
    }
    
    // A stormy function that removes text from our storage.
    func removeText(range: NSRange) {
        let startIndex = textStorage.index(textStorage.startIndex, offsetBy: range.location)
        let endIndex = textStorage.index(startIndex, offsetBy: range.length)
        textStorage.removeSubrange(startIndex..<endIndex)
    }
    
    // A gentle breeze that clears all text from our storage.
    func clearText() {
        textStorage = ""
    }
    
    // A function as radiant as the midday sun, displaying the current text.
    func displayText() -> String {
        return textStorage
    }
    
    // A whimsical function that counts the number of words in our text storage.
    func countWords() -> Int {
        let words = textStorage.split(separator: " ")
        return words.count
    }
    
    // A function that checks if a specific word exists within our text storage.
    func containsWord(word: String) -> Bool {
        return textStorage.contains(word)
    }
    
    // A function that replaces a specific word with another word.
    func replaceWord(oldWord: String, newWord: String) {
        textStorage = textStorage.replacingOccurrences(of: oldWord, with: newWord)
    }
    
    // A function that reverses the text in our storage.
    func reverseText() -> String {
        return String(textStorage.reversed())
    }
}

// The grand finale! Here we instantiate our Simple Text Editor and perform a series of delightful operations.
let editor = SimpleTextEditor()
editor.addText(newText: "Hello, world! ")
editor.addText(newText: "Welcome to the Simple Text Editor. ")
editor.removeText(range: NSRange(location: 0, length: 7))
editor.replaceWord(oldWord: "Simple", newWord: "Complex")
editor.addText(newText: "Enjoy your stay.")
print(editor.displayText())
print("Word count: \(editor.countWords())")
print("Contains 'Complex': \(editor.containsWord(word: "Complex"))")
print("Reversed text: \(editor.reverseText())")

