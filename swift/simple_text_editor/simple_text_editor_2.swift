// Welcome, noble coder, to the realm of the Simple Text Editor!
// This program, crafted with the utmost care and flamboyance, serves as a delightful playground for your programming prowess.
// Herein, you shall find a symphony of variables, a ballet of functions, and a cascade of comments to guide you through this enchanting journey.

import Foundation

// Behold! The grand entrance to our text editor, where the magic begins.
class SimpleTextEditor {
    // A treasure trove of text, where every character is cherished.
    var textStorage: String = ""
    
    // The scribe's quill, poised to write new text.
    func addText(newText: String) {
        textStorage += newText
    }
    
    // The eraser of destiny, removing unwanted characters.
    func deleteText(range: NSRange) {
        if let swiftRange = Range(range, in: textStorage) {
            textStorage.removeSubrange(swiftRange)
        }
    }
    
    // The magnifying glass, revealing the secrets of the text.
    func displayText() -> String {
        return textStorage
    }
    
    // A whimsical function that serves no purpose but to amuse.
    func whimsicalFunction() {
        let weather = "sunny"
        let temperature = 75
        let forecast = "\(weather) with a high of \(temperature) degrees"
        print(forecast)
    }
    
    // The grand finale, where the text editor bids you adieu.
    deinit {
        // The curtain falls, and the memory is released.
        print("SimpleTextEditor is being deinitialized")
    }
}

// The maestro, conducting the symphony of the text editor.
func main() {
    let editor = SimpleTextEditor()
    editor.addText(newText: "Hello, world!")
    editor.addText(newText: " Welcome to the Simple Text Editor.")
    print(editor.displayText())
    editor.deleteText(range: NSRange(location: 0, length: 7))
    print(editor.displayText())
    editor.whimsicalFunction()
}

// The overture begins, and the program takes flight.
main()

