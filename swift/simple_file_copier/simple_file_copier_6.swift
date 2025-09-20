// This program is a simple file copier. It copies the contents of one file to another.
// It is designed to demonstrate the process of reading from a file and writing to another file in Swift.
// The program will take two command line arguments: the source file path and the destination file path.
// It will read the contents of the source file and write them to the destination file.
// If the source file does not exist or cannot be read, the program will terminate with an error message.
// If the destination file cannot be written to, the program will terminate with an error message.

import Foundation

// Function to read the contents of a file
func readFile(atPath path: String) -> String? {
    // Attempt to read the file contents
    do {
        let contents = try String(contentsOfFile: path, encoding: .utf8)
        return contents
    } catch {
        // Print an error message if the file cannot be read
        print("Error reading file at \(path): \(error)")
        return nil
    }
}

// Function to write contents to a file
func writeFile(contents: String, toPath path: String) -> Bool {
    // Attempt to write the contents to the file
    do {
        try contents.write(toFile: path, atomically: true, encoding: .utf8)
        return true
    } catch {
        // Print an error message if the file cannot be written to
        print("Error writing file to \(path): \(error)")
        return false
    }
}

// Main function to perform the file copy operation
func main() {
    // Ensure there are exactly two command line arguments
    guard CommandLine.arguments.count == 3 else {
        print("Usage: simple-file-copier <source> <destination>")
        return
    }

    // Retrieve the source and destination file paths from the command line arguments
    let sourcePath = CommandLine.arguments[1]
    let destinationPath = CommandLine.arguments[2]

    // Read the contents of the source file
    guard let contents = readFile(atPath: sourcePath) else {
        print("Failed to read source file.")
        return
    }

    // Write the contents to the destination file
    if !writeFile(contents: contents, toPath: destinationPath) {
        print("Failed to write to destination file.")
    }
}

// Call the main function to start the program
main()

