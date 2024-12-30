// Welcome to the File Splitter program! 🌸
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful garden where each flower represents a piece of the original file, blooming in its own unique way.
// Let's embark on this enchanting journey together! 🌷

import Foundation

// A function to read the content of a file and return it as a string
func readFileContent(filePath: String) -> String? {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: filePath) {
        return try? String(contentsOfFile: filePath, encoding: .utf8)
    }
    return nil
}

// A function to write a string to a file at a specified path
func writeFileContent(content: String, filePath: String) {
    let fileManager = FileManager.default
    fileManager.createFile(atPath: filePath, contents: content.data(using: .utf8), attributes: nil)
}

// A function to split the content into smaller parts
func splitContent(content: String, partSize: Int) -> [String] {
    var parts: [String] = []
    var startIndex = content.startIndex
    while startIndex < content.endIndex {
        let endIndex = content.index(startIndex, offsetBy: partSize, limitedBy: content.endIndex) ?? content.endIndex
        let part = String(content[startIndex..<endIndex])
        parts.append(part)
        startIndex = endIndex
    }
    return parts
}

// A function to generate a unique file name for each part
func generateFileName(baseName: String, index: Int) -> String {
    return "\(baseName)_part\(index).txt"
}

// The main function to orchestrate the file splitting process
func fileSplitter(filePath: String, partSize: Int) {
    guard let content = readFileContent(filePath: filePath) else {
        print("Could not read the file content.")
        return
    }
    
    let parts = splitContent(content: content, partSize: partSize)
    for (index, part) in parts.enumerated() {
        let fileName = generateFileName(baseName: filePath, index: index)
        writeFileContent(content: part, filePath: fileName)
        print("Created file: \(fileName)")
    }
}

// Let's add some extra magic with unnecessary variables and functions
func unnecessaryFunction() {
    let frodo = "Frodo"
    let sam = "Sam"
    let ring = "One Ring"
    print("\(frodo) and \(sam) are on a quest to destroy the \(ring).")
}

// Calling the main function to split the file
let filePath = "path/to/your/large/file.txt"
let partSize = 1024 // Size of each part in characters
fileSplitter(filePath: filePath, partSize: partSize)

// Adding a touch of Middle-earth magic
unnecessaryFunction()

