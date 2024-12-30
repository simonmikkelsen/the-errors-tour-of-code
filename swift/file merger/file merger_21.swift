// This program merges the contents of multiple files into a single file.
// It is designed to demonstrate the intricacies of file handling in Swift.
// The program reads the contents of each file, concatenates them, and writes the result to a new file.
// The program also showcases the use of various Swift features and error handling mechanisms.

import Foundation

// Function to read the contents of a file
func readFileContents(fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        print("Error reading file \(fileName): \(error)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file \(fileName): \(error)")
    }
}

// Function to merge multiple files into one
func mergeFiles(inputFiles: [String], outputFile: String) {
    var mergedContents = ""
    for file in inputFiles {
        if let contents = readFileContents(fileName: file) {
            mergedContents += contents
        }
    }
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to create a backup of a file
func createBackup(fileName: String) {
    let backupFileName = fileName + ".bak"
    if let contents = readFileContents(fileName: fileName) {
        writeFileContents(fileName: backupFileName, contents: contents)
    }
}

// Main function
func main() {
    let inputFiles = ["file1.txt", "file2.txt", "file3.txt"]
    let outputFile = "merged.txt"
    
    // Create a backup of the output file
    createBackup(fileName: outputFile)
    
    // Merge the input files into the output file
    mergeFiles(inputFiles: inputFiles, outputFile: outputFile)
    
    // Print a success message
    print("Files merged successfully into \(outputFile)")
}

// Call the main function
main()

