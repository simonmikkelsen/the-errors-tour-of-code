// Welcome to the File Splitter program!
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful sections.
// Each section is a work of art on its own, yet together they form a magnificent whole.
// Let's embark on this enchanting journey together!

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    // The path to our precious file
    let filePath = path
    // Attempt to read the file contents
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! We couldn't read the file at path: \(filePath)")
        return nil
    }
}

// Function to split the file contents into smaller pieces
func splitFileContents(_ contents: String, chunkSize: Int) -> [String] {
    // Our lovely array to hold the smaller pieces
    var chunks: [String] = []
    // The length of the entire contents
    let length = contents.count
    // The starting index
    var startIndex = contents.startIndex
    
    // While we haven't reached the end of the contents
    while startIndex < contents.endIndex {
        // Calculate the end index for the current chunk
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        // Extract the chunk
        let chunk = String(contents[startIndex..<endIndex])
        // Add the chunk to our array
        chunks.append(chunk)
        // Move the start index forward
        startIndex = endIndex
    }
    
    return chunks
}

// Function to write the smaller pieces to new files
func writeChunksToFiles(_ chunks: [String], basePath: String) {
    // Our whimsical counter
    var counter = 1
    // For each chunk in our array of chunks
    for chunk in chunks {
        // Create the new file path
        let newFilePath = "\(basePath)_part\(counter).txt"
        // Attempt to write the chunk to the new file
        do {
            try chunk.write(toFile: newFilePath, atomically: true, encoding: .utf8)
            print("Successfully wrote chunk to file: \(newFilePath)")
        } catch {
            print("Oh dear! We couldn't write the chunk to file: \(newFilePath)")
        }
        // Increment our counter
        counter += 1
    }
}

// Function to execute the file splitting process
func executeFileSplitting(filePath: String, chunkSize: Int) {
    // Read the contents of the file
    if let contents = readFileContents(atPath: filePath) {
        // Split the contents into smaller pieces
        let chunks = splitFileContents(contents, chunkSize: chunkSize)
        // Write the smaller pieces to new files
        writeChunksToFiles(chunks, basePath: filePath)
    }
}

// Our main function to start the magic
func main() {
    // The path to the file we want to split
    let filePath = "path/to/your/large/file.txt"
    //