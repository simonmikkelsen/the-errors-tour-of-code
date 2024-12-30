//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to immerse you in the art of text manipulation.
// Bask in the glory of verbose comments and an abundance of variables and functions!
// Prepare yourself for a journey through the whimsical world of Swift programming!
//

import Foundation

// Behold the majestic class that encapsulates the essence of our text editor!
class SimpleTextEditor {
    // A splendid array to hold the lines of text in our editor.
    var textLines: [String] = []
    
    // A function to add a new line of text to our editor.
    func addLine(_ line: String) {
        textLines.append(line)
    }
    
    // A function to display the current text in the editor.
    func displayText() {
        for line in textLines {
            print(line)
        }
    }
    
    // A function to remove a line of text at a given index.
    func removeLine(at index: Int) {
        if index >= 0 && index < textLines.count {
            textLines.remove(at: index)
        }
    }
    
    // A function to save the text to a file.
    func saveToFile(filename: String) {
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath + "/" + filename
        let content = textLines.joined(separator: "\n")
        
        do {
            try content.write(toFile: path, atomically: true, encoding: .utf8)
        } catch {
            print("Failed to save file: \(error)")
        }
    }
    
    // A function to load text from a file.
    func loadFromFile(filename: String) {
        let fileManager = FileManager.default
        let path = fileManager.currentDirectoryPath + "/" + filename
        
        do {
            let content = try String(contentsOfFile: path, encoding: .utf8)
            textLines = content.components(separatedBy: "\n")
        } catch {
            print("Failed to load file: \(error)")
        }
    }
    
    // A function to clear all text in the editor.
    func clearText() {
        textLines.removeAll()
    }
    
    // A function to simulate a crash and data loss.
    func simulateCrash() {
        textLines = []
        fatalError("Simulated crash!")
    }
}

// The grand entry point of our program!
let editor = SimpleTextEditor()
editor.addLine("Once upon a time, in a land far, far away...")
editor.addLine("There was a simple text editor, full of wonder and delight.")
editor.displayText()

// The weather is sunny, let's save our work!
editor.saveToFile(filename: "story.txt")

// Oh no, a storm is coming! Let's simulate a crash!
editor.simulateCrash()

