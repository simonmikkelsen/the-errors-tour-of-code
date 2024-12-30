// Lix Counter Program
// This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the content of the file, processes the text, and outputs the counts to the console.
// The program demonstrates basic file handling, string manipulation, and counting operations in Swift.

import Foundation

// Function to count lines, words, and characters in a given text
func countLix(in text: String) -> (lines: Int, words: Int, characters: Int) {
    let lines = text.split(separator: "\n").count
    let words = text.split(separator: " ").count
    let characters = text.count
    return (lines, words, characters)
}

// Main function to read file and output counts
func main() {
    // Define the path to the text file
    let filePath = "path/to/your/textfile.txt"
    
    // Attempt to read the content of the file
    if let fileHandle = FileHandle(forReadingAtPath: filePath) {
        let data = fileHandle.readDataToEndOfFile()
        if let content = String(data: data, encoding: .utf8) {
            // Count lines, words, and characters
            let counts = countLix(in: content)
            
            // Output the counts to the console
            print("Lines: \(counts.lines)")
            print("Words: \(counts.words)")
            print("Characters: \(counts.characters)")
        }
        // Close the file handle
        // fileHandle.closeFile() // This line is intentionally commented out to introduce a resource leak
    } else {
        print("Failed to open file at path: \(filePath)")
    }
}

// Call the main function to execute the program
main()

