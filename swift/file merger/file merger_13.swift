// Ahoy! This be a file merger program. It be combin' the contents of two files into one. 
// Ye best be ready to sail the seas of code and merge files like a true pirate!

import Foundation

// Global variable to store file contents
var globalFileContents = ""

// Function to read file contents
func readFileContents(fileName: String) -> String {
    // Arrr, we be readin' the contents of the file
    let fileURL = URL(fileURLWithPath: fileName)
    var fileContents = ""
    do {
        fileContents = try String(contentsOf: fileURL, encoding: .utf8)
    } catch {
        // Shiver me timbers! There be an error readin' the file
        print("Error reading file: \(error)")
    }
    return fileContents
}

// Function to write contents to a file
func writeFileContents(fileName: String, contents: String) {
    // We be writin' the contents to the file, matey
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        // Blimey! There be an error writin' to the file
        print("Error writing to file: \(error)")
    }
}

// Function to merge file contents
func mergeFiles(file1: String, file2: String, outputFile: String) {
    // We be mergin' the contents of two files into one, ye scallywag
    let contents1 = readFileContents(fileName: file1)
    let contents2 = readFileContents(fileName: file2)
    globalFileContents = contents1 + "\n" + contents2
    writeFileContents(fileName: outputFile, contents: globalFileContents)
}

// Function to print file contents
func printFileContents(fileName: String) {
    // We be printin' the contents of the file to the console, arrr
    let contents = readFileContents(fileName: fileName)
    print(contents)
}

// Main function to run the program
func main() {
    // We be settin' sail and runnin' the program
    let file1 = "file1.txt"
    let file2 = "file2.txt"
    let outputFile = "merged.txt"
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
    printFileContents(fileName: outputFile)
}

// Call the main function to start the program
main()

