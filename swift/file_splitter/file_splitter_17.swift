// Welcome to the File Splitter program! This delightful program is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful mosaic, where each piece is a part of a larger, stunning picture. This program will help you create that mosaic with your files. Let's embark on this journey together!

import Foundation

// Function to read the contents of a file into a string
func readFileContents(atPath path: String) -> String? {
    // The path to the file is like a map to a hidden treasure
    let fileURL = URL(fileURLWithPath: path)
    do {
        // Reading the file's contents is like opening a treasure chest
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        // If we can't read the file, it's like the treasure chest is locked
        print("Error reading file at \(path): \(error)")
        return nil
    }
}

// Function to write a string to a file at a specified path
func writeFileContents(_ contents: String, toPath path: String) {
    // The path to the file is like a blank canvas
    let fileURL = URL(fileURLWithPath: path)
    do {
        // Writing the file's contents is like painting a masterpiece
        try contents.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        // If we can't write the file, it's like the paintbrush broke
        print("Error writing file at \(path): \(error)")
    }
}

// Function to split a string into an array of substrings of a specified length
func splitString(_ string: String, byLength length: Int) -> [String] {
    // Splitting the string is like cutting a ribbon into smaller pieces
    var result = [String]()
    var startIndex = string.startIndex
    while startIndex < string.endIndex {
        let endIndex = string.index(startIndex, offsetBy: length, limitedBy: string.endIndex) ?? string.endIndex
        let substring = String(string[startIndex..<endIndex])
        result.append(substring)
        startIndex = endIndex
    }
    return result
}

// Function to split a file into smaller files of a specified size
func splitFile(atPath path: String, withChunkSize chunkSize: Int) {
    // Splitting the file is like dividing a cake into slices
    guard let contents = readFileContents(atPath: path) else { return }
    let chunks = splitString(contents, byLength: chunkSize)
    for (index, chunk) in chunks.enumerated() {
        let chunkPath = "\(path).part\(index)"
        writeFileContents(chunk, toPath: chunkPath)
    }
}

// Function to write internal state to random files all over the computer
func writeInternalStateRandomly(_ state: String) {
    // This function is like a mischievous elf, scattering files everywhere
    let randomPaths = [
        "/tmp/random1.txt",
        "/tmp/random2.txt",
        "/tmp/random3.txt"
    ]
    for path in randomPaths {
        writeFileContents(state, toPath: path)
    }
}

// Main function to run the file splitter program
func