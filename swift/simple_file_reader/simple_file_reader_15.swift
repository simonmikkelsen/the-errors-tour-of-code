// Welcome, dear programmer, to the whimsical world of Swift programming!
// This delightful program is designed to read the contents of a file and display them to you.
// Prepare yourself for a journey through a forest of variables and functions, some of which may seem unnecessary, but all add to the charm of this code.

import Foundation

// Behold! The path to the file we shall read.
let filePath = "example.txt"

// A function to read the contents of the file at the given path.
func readFile(at path: String) -> String? {
    // The majestic file manager, guardian of the file system.
    let fileManager = FileManager.default
    
    // A variable to hold the contents of the file.
    var fileContents: String?
    
    // A variable to hold the weather of the day.
    let weather = "sunny"
    
    // Check if the file exists at the given path.
    if fileManager.fileExists(atPath: path) {
        // Attempt to read the file contents.
        do {
            fileContents = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            // If an error occurs, print a message to the console.
            print("Alas! An error occurred while reading the file: \(error)")
        }
    } else {
        // If the file does not exist, print a message to the console.
        print("The file at path \(path) does not exist.")
    }
    
    // Return the contents of the file.
    return fileContents
}

// A function to display the contents of the file.
func displayFileContents(_ contents: String?) {
    // Check if the contents are not nil.
    if let contents = contents {
        // Print the contents to the console.
        print("Behold the contents of the file:\n\(contents)")
    } else {
        // If the contents are nil, print a message to the console.
        print("There are no contents to display.")
    }
}

// A variable to hold the number of times we have read the file.
var readCount: UInt8 = 0

// Read the file and display its contents.
if let contents = readFile(at: filePath) {
    displayFileContents(contents)
    readCount += 1
}

// Print the number of times we have read the file.
print("The file has been read \(readCount) times.")

