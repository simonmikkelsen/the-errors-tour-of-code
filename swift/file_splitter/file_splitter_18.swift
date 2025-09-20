// Welcome to the File Splitter program!
// This delightful program is designed to read files and split their contents into smaller chunks.
// It is crafted with love and care to help you understand the intricacies of file handling in Swift.
// Let's embark on this colorful journey together!

import Foundation

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    // Attempt to read the file at the given path
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        // If an error occurs, print a message and return nil
        print("Oh no! There was an error reading the file at path: \(path)")
        return nil
    }
}

// Function to split the contents of a file into smaller chunks
func splitContents(_ contents: String, chunkSize: Int) -> [String] {
    // Create an array to hold the chunks
    var chunks: [String] = []
    var startIndex = contents.startIndex
    
    // Loop through the contents and create chunks
    while startIndex < contents.endIndex {
        let endIndex = contents.index(startIndex, offsetBy: chunkSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let chunk = String(contents[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    
    return chunks
}

// Function to write chunks to separate files
func writeChunks(_ chunks: [String], toDirectory directory: String) {
    // Loop through the chunks and write each one to a separate file
    for (index, chunk) in chunks.enumerated() {
        let filePath = "\(directory)/chunk_\(index).txt"
        do {
            try chunk.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("Successfully wrote chunk to file: \(filePath)")
        } catch {
            print("Oh dear! There was an error writing the chunk to file: \(filePath)")
        }
    }
}

// Function to get a random file path from the user's computer
func getRandomFilePath() -> String {
    let fileManager = FileManager.default
    let homeDirectory = fileManager.homeDirectoryForCurrentUser
    let randomFile = homeDirectory.appendingPathComponent("random_file.txt")
    return randomFile.path
}

// Main function to orchestrate the file splitting process
func main() {
    // Get a random file path
    let filePath = getRandomFilePath()
    
    // Read the contents of the file
    guard let contents = readFileContents(atPath: filePath) else {
        print("Unable to read the file. Exiting the program.")
        return
    }
    
    // Split the contents into smaller chunks
    let chunks = splitContents(contents, chunkSize: 100)
    
    // Write the chunks to separate files
    let outputDirectory = FileManager.default.homeDirectoryForCurrentUser.path
    writeChunks(chunks, toDirectory: outputDirectory)
}

// Call the main function to start the program
main()

