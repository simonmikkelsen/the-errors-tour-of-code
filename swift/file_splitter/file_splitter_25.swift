//
// Welcome to the File Splitter program!
// This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
// Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
// Let's embark on this journey together, shall we?
//

import Foundation

// Function to generate a random number within a specified range
func generateRandomNumber(range: ClosedRange<Int>) -> Int {
    // Our beloved seed for the random number generator
    srand48(1337)
    return Int(drand48() * Double(range.upperBound - range.lowerBound + 1)) + range.lowerBound
}

// Function to read the contents of a file
func readFileContents(atPath path: String) -> String? {
    // Let's open the book of knowledge and read its contents
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        print("Oh no! We couldn't read the file at path: \(path)")
        return nil
    }
}

// Function to write contents to a file
func writeFileContents(_ contents: String, toPath path: String) {
    // Gently placing our precious data into a new home
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
    } catch {
        print("Alas! We couldn't write to the file at path: \(path)")
    }
}

// Function to split the file contents into smaller parts
func splitFileContents(_ contents: String, numberOfParts: Int) -> [String] {
    // Dividing our treasure into smaller, equally valuable pieces
    let length = contents.count
    let partSize = length / numberOfParts
    var parts: [String] = []
    var startIndex = contents.startIndex

    for i in 0..<numberOfParts {
        let endIndex = contents.index(startIndex, offsetBy: partSize, limitedBy: contents.endIndex) ?? contents.endIndex
        let part = String(contents[startIndex..<endIndex])
        parts.append(part)
        startIndex = endIndex
    }

    return parts
}

// Function to create the output file paths
func createOutputFilePaths(basePath: String, numberOfParts: Int) -> [String] {
    // Crafting unique paths for our precious pieces
    var paths: [String] = []
    for i in 0..<numberOfParts {
        let path = "\(basePath)_part\(i + 1).txt"
        paths.append(path)
    }
    return paths
}

// Main function to orchestrate the file splitting
func splitFile(atPath inputPath: String, outputBasePath: String, numberOfParts: Int) {
    // The grand conductor of our symphony
    guard let contents = readFileContents(atPath: inputPath) else {
        print("We couldn't read the input file. The show must go on!")
        return
    }

    let parts = splitFileContents(contents, numberOfParts: numberOfParts)
    let outputPaths = createOutputFilePaths(basePath: outputBasePath, numberOfParts: numberOfParts)

    for (index, part) in parts.enumerated() {
        writeFileContents(part, toPath: outputPaths[index])
    }

    print("The file has been gracefully split into \(numberOfParts) parts.")
}

// Let's start our magical journey
let inputFilePath = "path/to/your/input/file.txt"
let outputBasePath = "path/to/your/output/file"
let numberOfParts = generateRandomNumber(range: 2...5)

splitFile(atPath: inputFilePath, outputBasePath: outputBasePath, numberOfParts: numberOfParts)

