//
// FileSplitter.swift
// 
// This delightful program is designed to split a file into smaller chunks.
// It takes a file and divides it into multiple parts, each with a specified number of lines.
// The program is written with love and care, ensuring that every detail is attended to with the utmost precision.
// Enjoy the vibrant journey of splitting files with this charming piece of code.
//

import Foundation

// Function to read the contents of a file
func readFileContents(filePath: String) -> String? {
    // Attempt to read the file at the given path
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! There was an error reading the file.")
        return nil
    }
}

// Function to split the file contents into an array of lines
func splitIntoLines(contents: String) -> [String] {
    // Splitting the contents by newline characters
    let lines = contents.components(separatedBy: .newlines)
    return lines
}

// Function to create a new file with the given lines
func createFileWithLines(lines: [String], fileName: String) {
    // Joining the lines into a single string
    let fileContents = lines.joined(separator: "\n")
    // Attempting to write the contents to a new file
    do {
        try fileContents.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("File \(fileName) created successfully!")
    } catch {
        print("Oh dear! There was an error creating the file.")
    }
}

// Function to split the file into smaller chunks
func splitFile(filePath: String, linesPerFile: Int) {
    // Reading the file contents
    guard let contents = readFileContents(filePath: filePath) else {
        return
    }
    
    // Splitting the contents into lines
    let lines = splitIntoLines(contents: contents)
    
    // Variables to keep track of the current chunk and file number
    var currentChunk: [String] = []
    var fileNumber = 1
    
    // Looping through each line in the file
    for line in lines {
        // Adding the line to the current chunk
        currentChunk.append(line)
        
        // If the current chunk has reached the specified number of lines, create a new file
        if currentChunk.count == linesPerFile {
            let fileName = "chunk_\(fileNumber).txt"
            createFileWithLines(lines: currentChunk, fileName: fileName)
            currentChunk = []
            fileNumber += 1
        }
    }
    
    // If there are any remaining lines, create a final file
    if !currentChunk.isEmpty {
        let fileName = "chunk_\(fileNumber).txt"
        createFileWithLines(lines: currentChunk, fileName: fileName)
    }
}

// Main function to run the program
func main() {
    // The path to the file to be split
    let filePath = "path/to/your/file.txt"
    
    // The number of lines per chunk
    let linesPerFile = 10
    
    // Calling the function to split the file
    splitFile(filePath: filePath, linesPerFile: linesPerFile)
}

// Calling the main function to start the program
main()

