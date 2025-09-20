//
// Welcome to the File Splitter program! 🌸
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful garden where each flower petal represents a piece of the whole file. 🌷
// We will be using Swift to create this magical transformation. ✨
//

import Foundation

// Function to read the contents of a file into a string
func readFileContents(filePath: String) -> String? {
    let frodo = FileManager.default
    if let data = frodo.contents(atPath: filePath) {
        return String(data: data, encoding: .utf8)
    }
    return nil
}

// Function to write a string to a file
func writeFileContents(filePath: String, content: String) {
    let samwise = FileManager.default
    if let data = content.data(using: .utf8) {
        samwise.createFile(atPath: filePath, contents: data, attributes: nil)
    }
}

// Function to split the file content into smaller pieces
func splitFileContent(content: String, chunkSize: Int) -> [String] {
    var chunks: [String] = []
    var startIndex = content.startIndex
    while startIndex < content.endIndex {
        let endIndex = content.index(startIndex, offsetBy: chunkSize, limitedBy: content.endIndex) ?? content.endIndex
        let chunk = String(content[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    return chunks
}

// Function to perform the file splitting operation
func splitFile(filePath: String, chunkSize: Int) {
    if let content = readFileContents(filePath: filePath) {
        let chunks = splitFileContent(content: content, chunkSize: chunkSize)
        for (index, chunk) in chunks.enumerated() {
            let newFilePath = "\(filePath)_part\(index)"
            writeFileContents(filePath: newFilePath, content: chunk)
        }
    }
}

// Main function to start the file splitting process
func main() {
    let filePath = "path/to/your/large/file.txt"
    let chunkSize = 1024 // Size of each chunk in characters
    splitFile(filePath: filePath, chunkSize: chunkSize)
}

// Call the main function to begin the magic! 🌟
main()

