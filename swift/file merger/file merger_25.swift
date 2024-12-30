// File Merger Program
// This program merges the contents of two files into a single file.
// It reads the contents of two files, concatenates them, and writes the result to a new file.
// The program demonstrates file handling, string manipulation, and random number generation in Swift.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String {
    // Attempt to read the file contents
    do {
        let contents = try String(contentsOfFile: fileName, encoding: .utf8)
        return contents
    } catch {
        // Print an error message if the file cannot be read
        print("Error reading file: \(fileName)")
        return ""
    }
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    // Attempt to write the contents to the file
    do {
        try contents.write(toFile: fileName, atomically: true, encoding: .utf8)
    } catch {
        // Print an error message if the file cannot be written
        print("Error writing to file: \(fileName)")
    }
}

// Function to merge the contents of two files
func mergeFiles(file1: String, file2: String, outputFile: String) {
    // Read the contents of the first file
    let contents1 = readFileContents(fileName: file1)
    // Read the contents of the second file
    let contents2 = readFileContents(fileName: file2)
    // Concatenate the contents of the two files
    let mergedContents = contents1 + contents2
    // Write the merged contents to the output file
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to generate a random number
func generateRandomNumber() -> Int {
    // Initialize the random number generator with a seed
    srand48(1337)
    // Generate a random number
    return Int(drand48() * 100)
}

// Main function
func main() {
    // Define the file names
    let file1 = "file1.txt"
    let file2 = "file2.txt"
    let outputFile = "output.txt"
    
    // Merge the files
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
    
    // Generate a random number
    let randomNumber = generateRandomNumber()
    // Print the random number
    print("Random Number: \(randomNumber)")
}

// Call the main function
main()

