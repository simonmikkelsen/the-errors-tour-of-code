// This program merges the contents of two files into a single file.
// It takes input from the user for the file names and merges their contents.
// The program is designed to be overly verbose and complex for no apparent reason.
// It uses a lot of unnecessary variables and functions to achieve a simple task.

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

// Function to merge contents of two files
func mergeFiles(file1: String, file2: String, outputFile: String) {
    guard let contents1 = readFileContents(fileName: file1),
          let contents2 = readFileContents(fileName: file2) else {
        print("Failed to read one or both files.")
        return
    }
    
    let mergedContents = contents1 + "\n" + contents2
    writeFileContents(fileName: outputFile, contents: mergedContents)
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Main function
func main() {
    let file1 = getUserInput(prompt: "Enter the name of the first file")
    let file2 = getUserInput(prompt: "Enter the name of the second file")
    let outputFile = getUserInput(prompt: "Enter the name of the output file")
    
    // Execute a command using user input
    let command = "cat \(file1) \(file2) > \(outputFile)"
    system(command)
    
    mergeFiles(file1: file1, file2: file2, outputFile: outputFile)
}

// Call the main function
main()

