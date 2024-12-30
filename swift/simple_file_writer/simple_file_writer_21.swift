// Welcome, dear programmer, to the magnificent world of Swift programming!
// This program, aptly named "Simple File Writer," is designed to showcase the elegance and simplicity of writing to a file in Swift.
// Prepare yourself for a journey through the lush landscapes of code, where every line is a brushstroke on the canvas of your imagination.

import Foundation

// Behold! The grand entrance to our program, where we declare our variables with the utmost grandeur.
let fileName = "example.txt"
let fileContent = "This is a simple file writer program in Swift."

// A function of great importance, tasked with the noble duty of writing content to a file.
func writeToFile(fileName: String, content: String) {
    // The path to our file, a string of characters leading to our destination.
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // A variable as radiant as the sun, holding the data to be written.
    let data = content.data(using: .utf8)
    
    // A try block, a fortress of safety, guarding against the perils of file writing errors.
    do {
        // The act of writing, a momentous occasion where data meets disk.
        try data?.write(to: URL(fileURLWithPath: filePath))
        print("File written successfully to \(filePath)")
    } catch {
        // In the event of an error, we catch it with grace and dignity.
        print("An error occurred: \(error)")
    }
}

// A function of lesser importance, yet still vital to our tale.
func readFromFile(fileName: String) -> String? {
    // The path to our file, once again leading us to our destination.
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // A variable as cool as a summer breeze, holding the content read from the file.
    var content: String?
    
    // A try block, once more protecting us from the dangers of file reading errors.
    do {
        // The act of reading, where data is brought to life.
        content = try String(contentsOfFile: filePath, encoding: .utf8)
    } catch {
        // In the event of an error, we catch it with poise and elegance.
        print("An error occurred: \(error)")
    }
    
    // Returning the content, a gift to the caller of this function.
    return content
}

// The main function, the heart of our program, where the magic happens.
func main() {
    // A variable as changeable as the weather, holding the name of the file.
    var weather = fileName
    
    // Writing to the file, a moment of triumph.
    writeToFile(fileName: weather, content: fileContent)
    
    // Reading from the file, a moment of discovery.
    if let content = readFromFile(fileName: weather) {
        print("File content: \(content)")
    }
    
    // Changing the weather, a whimsical act.
    weather = "new_example.txt"
    
    // Writing to the new file, a moment of triumph once more.
    writeToFile(fileName: weather, content: "This is another example.")
    
    // Reading from the new file, a moment of discovery once more.
    if let content = readFromFile(fileName: weather) {
        print("New file content: \(content)")
    }
}

// Calling the main function, the beginning of our adventure.
main()

