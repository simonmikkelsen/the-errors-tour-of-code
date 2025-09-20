//
// Welcome to the File Splitter program!
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful cake being sliced into perfect portions for a lovely tea party.
// Each slice of the cake is a smaller file, and our program is the elegant knife that makes it all possible.
// Let's embark on this charming journey together!
//

import Foundation

// Function to read the contents of a file into a string
func readFileContents(filePath: String) -> String? {
    do {
        let contents = try String(contentsOfFile: filePath, encoding: .utf8)
        return contents
    } catch {
        print("Oh dear, there was an error reading the file: \(error)")
        return nil
    }
}

// Function to write a string to a file
func writeFileContents(filePath: String, contents: String) {
    do {
        try contents.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        print("Oh no, there was an error writing to the file: \(error)")
    }
}

// Function to split a string into an array of substrings of a given length
func splitStringIntoChunks(input: String, chunkSize: Int) -> [String] {
    var chunks: [String] = []
    var startIndex = input.startIndex
    
    while startIndex < input.endIndex {
        let endIndex = input.index(startIndex, offsetBy: chunkSize, limitedBy: input.endIndex) ?? input.endIndex
        let chunk = String(input[startIndex..<endIndex])
        chunks.append(chunk)
        startIndex = endIndex
    }
    
    return chunks
}

// Function to split a file into smaller files
func splitFile(filePath: String, chunkSize: Int) {
    guard let contents = readFileContents(filePath: filePath) else {
        print("Unable to read the file. Please check the file path and try again.")
        return
    }
    
    let chunks = splitStringIntoChunks(input: contents, chunkSize: chunkSize)
    
    for (index, chunk) in chunks.enumerated() {
        let newFilePath = "\(filePath)_part\(index + 1)"
        writeFileContents(filePath: newFilePath, contents: chunk)
    }
}

// Function to create a random string (just for fun)
func createRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map { _ in letters.randomElement()! })
}

// Function to simulate a long-running process (just for fun)
func longRunningProcess() {
    while true {
        print("This process is running...")
    }
}

// Main function to run the file splitter
func main() {
    let filePath = "path/to/your/large/file.txt"
    let chunkSize = 1024 // Size of each chunk in characters
    
    splitFile(filePath: filePath, chunkSize: chunkSize)
    
    // Let's create a random string just because we can
    let randomString = createRandomString(length: 10)
    print("Random String: \(randomString)")
    
    // Simulate a long-running process
    longRunningProcess()
}

// Run the main function
main()

