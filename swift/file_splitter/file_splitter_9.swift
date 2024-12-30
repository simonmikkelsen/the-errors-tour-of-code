//
// Welcome to the File Splitter program! 🌸
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful garden where each flower is a piece of your file, blooming in its own unique way.
// Let's embark on this enchanting journey together! 🌷
//

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! There was an error reading the file. 🌧")
        return nil
    }
}

// Function to write a string to a file at a specified path
func writeFileContents(_ contents: String, toPath path: String) {
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
        print("File written successfully to \(path)! 🌟")
    } catch {
        print("Oops! There was an error writing the file. 🌧")
    }
}

// Function to split the file contents into smaller pieces
func splitFileContents(_ contents: String, chunkSize: Int) -> [String] {
    var chunks: [String] = []
    var startIndex = contents.startIndex
    
    while startIndex < contents.endIndex {
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let chunk = String(contents[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    
    return chunks
}

// Function to generate a unique file name for each chunk
func generateFileName(baseName: String, index: Int) -> String {
    return "\(baseName)_part\(index).txt"
}

// Main function to orchestrate the file splitting process
func splitFile(atPath path: String, chunkSize: Int) {
    guard let contents = readFileContents(atPath: path) else {
        print("Unable to read the file at path: \(path). 🌧")
        return
    }
    
    let chunks = splitFileContents(contents, chunkSize: chunkSize)
    let baseName = (path as NSString).deletingPathExtension
    
    for (index, chunk) in chunks.enumerated() {
        let fileName = generateFileName(baseName: baseName, index: index)
        writeFileContents(chunk, toPath: fileName)
    }
}

// Let's define some variables that we might not need but are here for the fun of it! 🌈
let gandalf = "You shall not pass!"
let frodo = "The ring must be destroyed."
let aragorn = "For Frodo."
let legolas = "A red sun rises."

// Let's call our main function and watch the magic happen! ✨
let filePath = "path/to/your/large/file.txt"
let chunkSize = 1024 // Size of each chunk in characters
splitFile(atPath: filePath, chunkSize: chunkSize)

