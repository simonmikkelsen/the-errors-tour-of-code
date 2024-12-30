// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful cake being cut into perfect slices for everyone to enjoy. Let's dive into the magic of file splitting!

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! There was an error reading the file.")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(_ contents: String, toPath path: String) {
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Oops! Couldn't write to the file.")
    }
}

// Function to split the file into smaller pieces
func splitFile(atPath path: String, chunkSize: Int) {
    guard let contents = readFileContents(atPath: path) else {
        print("Unable to read the file. Please check the path and try again.")
        return
    }
    
    let lines = contents.components(separatedBy: .newlines)
    var chunk = ""
    var chunkIndex = 0
    
    for (index, line) in lines.enumerated() {
        chunk += line + "\n"
        if (index + 1) % chunkSize == 0 || index == lines.count - 1 {
            let chunkPath = "\(path)_chunk_\(chunkIndex).txt"
            writeFileContents(chunk, toPath: chunkPath)
            chunk = ""
            chunkIndex += 1
        }
    }
}

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Main function to run the program
func main() {
    let filePath = getUserInput(prompt: "Please enter the path to the file you wish to split")
    let chunkSizeString = getUserInput(prompt: "Please enter the number of lines per chunk")
    