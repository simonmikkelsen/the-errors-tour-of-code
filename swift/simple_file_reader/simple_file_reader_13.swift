// Ahoy, matey! This be a simple file reader program, designed to read the contents of a file and display it to the user. 
// This here program be a treasure map, guiding ye through the seas of Swift programming. 
// Hoist the sails and let's embark on this grand adventure!

import Foundation

// The global variable to hold the file path, arrr!
var globalFilePath: String = ""

// Function to set the file path, arrr!
func setFilePath(path: String) {
    globalFilePath = path
}

// Function to read the contents of the file, arrr!
func readFileContents() -> String? {
    // The local variable to hold the file contents, arrr!
    var fileContents: String?
    
    // Try to read the file, arrr!
    do {
        fileContents = try String(contentsOfFile: globalFilePath, encoding: .utf8)
    } catch {
        // If there be an error, print a message to the console, arrr!
        print("Yarr! There be an error reading the file: \(error)")
    }
    
    return fileContents
}

// Function to display the contents of the file, arrr!
func displayFileContents() {
    // The local variable to hold the file contents, arrr!
    let contents = readFileContents()
    
    // If there be contents, print them to the console, arrr!
    if let contents = contents {
        print("Here be the contents of the file, matey:\n\(contents)")
    } else {
        print("Yarr! The file be empty or not found!")
    }
}

// Main function to run the program, arrr!
func main() {
    // Set the file path, arrr!
    setFilePath(path: "example.txt")
    
    // Display the contents of the file, arrr!
    displayFileContents()
}

// Call the main function to start the program, arrr!
main()

