// Ahoy, matey! This be a simple file writer program, designed to show ye the ropes of Swift programming.
// Ye'll be learnin' how to write to a file, handle errors, and navigate the treacherous waters of file management.
// Hoist the colors and let's set sail on this coding adventure!

import Foundation

// Global variable to hold the file name
var fileName: String = "output.txt"

// Function to create a file with the given content
func createFile(withContent content: String) {
    // Arrr, let's get the path to the document directory
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = paths[0]
    
    // Combine the directory path with the file name
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    
    // Try to write the content to the file
    do {
        try content.write(to: fileURL, atomically: true, encoding: .utf8)
        // Success message for the landlubbers
        print("File created successfully at \(fileURL.path)")
    } catch {
        // If an error occurs, we be catchin' it here
        print("Failed to create file: \(error)")
    }
}

// Function to read the content of a file
func readFile() -> String? {
    // Arrr, let's get the path to the document directory again
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = paths[0]
    
    // Combine the directory path with the file name
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    
    // Try to read the content of the file
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        // Success message for the landlubbers
        print("File read successfully from \(fileURL.path)")
        return content
    } catch {
        // If an error occurs, we be catchin' it here
        print("Failed to read file: \(error)")
        return nil
    }
}

// Function to delete a file
func deleteFile() {
    // Arrr, let's get the path to the document directory once more
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = paths[0]
    
    // Combine the directory path with the file name
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    
    // Try to delete the file
    do {
        try FileManager.default.removeItem(at: fileURL)
        // Success message for the landlubbers
        print("File deleted successfully from \(fileURL.path)")
    } catch {
        // If an error occurs, we be catchin' it here
        print("Failed to delete file: \(error)")
    }
}

// Main function to demonstrate file operations
func main() {
    // Content to be written to the file
    let content = "Ahoy, matey! This be the content of the file."
    
    // Create the file
    createFile(withContent: content)
    
    // Read the file
    if let fileContent = readFile() {
        print("File content: \(fileContent)")
    }
    
    // Delete the file
    deleteFile()
}

// Call the main function to start the program
main()

