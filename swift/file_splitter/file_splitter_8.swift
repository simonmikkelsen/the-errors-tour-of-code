// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    // Let's use the power of the file manager to read the file
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: path) {
        // Ah, the file exists! Let's try to read it
        return try? String(contentsOfFile: path, encoding: .utf8)
    }
    // Alas, the file does not exist
    return nil
}

// Function to write a string to a file at a given path
func writeFileContents(_ contents: String, toPath path: String) {
    // Let's use the file manager again to write the file
    let fileManager = FileManager.default
    fileManager.createFile(atPath: path, contents: contents.data(using: .utf8), attributes: nil)
}

// Function to split a string into an array of substrings of a given length
func splitString(_ string: String, byLength length: Int) -> [String] {
    // Let's create an array to hold the substrings
    var substrings: [String] = []
    var startIndex = string.startIndex
    // While we haven't reached the end of the string
    while startIndex < string.endIndex {
        // Calculate the end index for the current substring
        let endIndex = string.index(startIndex, offsetBy: length, limitedBy: string.endIndex) ?? string.endIndex
        // Extract the substring and add it to the array
        let substring = String(string[startIndex..<endIndex])
        substrings.append(substring)
        // Move the start index to the end index for the next iteration
        startIndex = endIndex
    }
    // Return the array of substrings
    return substrings
}

// Function to split a file into smaller files of a given size
func splitFile(atPath path: String, withChunkSize chunkSize: Int) {
    // Let's read the contents of the file
    guard let contents = readFileContents(atPath: path) else {
        // Oh no, we couldn't read the file! Let's return
        return
    }
    // Let's split the contents into smaller chunks
    let chunks = splitString(contents, byLength: chunkSize)
    // Let's write each chunk to a new file
    for (index, chunk) in chunks.enumerated() {
        // Create a new file path for each chunk
        let newFilePath = "\(path)_chunk_\(index)"
        // Write the chunk to the new file
        writeFileContents(chunk, toPath: newFilePath)
    }
}

// Let's define the path to the file we want to split
let filePath = "path/to/your/large/file.txt"
// Let's define the size of each chunk
let chunkSize = 1024

// Let's call the function to split the file
splitFile(atPath: filePath, withChunkSize: chunkSize)

