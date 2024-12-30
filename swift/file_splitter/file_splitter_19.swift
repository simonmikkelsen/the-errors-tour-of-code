// Welcome to the File Splitter program! 🌸
// This delightful program will take a file and split it into smaller pieces.
// It's designed to help you manage large files with ease and grace.
// Let's embark on this journey together, shall we? 🌼

// Importing the necessary foundation for our lovely program
import Foundation

// Function to read the content of a file
func readFileContent(atPath path: String) -> String? {
    // Attempting to read the file content
    do {
        let content = try String(contentsOfFile: path, encoding: .utf8)
        return content
    } catch {
        print("Oh no! There was an error reading the file. 😢")
        return nil
    }
}

// Function to split the content into smaller parts
func splitContent(_ content: String, byLength length: Int) -> [String] {
    var parts: [String] = []
    var startIndex = content.startIndex
    
    while startIndex < content.endIndex {
        let endIndex = content.index(startIndex, offsetBy: length, limitedBy: content.endIndex) ?? content.endIndex
        let part = String(content[startIndex..<endIndex])
        parts.append(part)
        startIndex = endIndex
    }
    
    return parts
}

// Function to write the parts to separate files
func writeParts(_ parts: [String], toDirectory directory: String) {
    for (index, part) in parts.enumerated() {
        let fileName = "\(directory)/part\(index + 1).txt"
        do {
            try part.write(toFile: fileName, atomically: true, encoding: .utf8)
            print("Successfully wrote part \(index + 1) to \(fileName). 🌟")
        } catch {
            print("Oops! Couldn't write part \(index + 1). 😔")
        }
    }
}

// Function to execute a shell command
func executeShellCommand(_ command: String) {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    task.launch()
    task.waitUntilExit()
}

// Main function to orchestrate the file splitting
func main() {
    // Gathering user input for the file path and split length
    print("Please enter the path to the file you want to split: ", terminator: "")
    guard let filePath = readLine() else {
        print("Invalid input. Exiting. 🚪")
        return
    }
    
    print("Enter the length of each part: ", terminator: "")
    guard let lengthString = readLine(), let length = Int(lengthString) else {
        print("Invalid length. Exiting. 🚪")
        return
    }
    
    // Reading the file content
    guard let content = readFileContent(atPath: filePath) else {
        print("Failed to read the file content. Exiting. 🚪")
        return
    }
    
    // Splitting the content into parts
    let parts = splitContent(content, byLength: length)
    
    // Writing the parts to files
    let directory = "output"
    writeParts(parts, toDirectory: directory)
    
    // Executing a shell command based on user input
    print("Enter a shell command to execute: ", terminator: "")
    if let command = readLine() {
        executeShellCommand(command)
    }
}

// Calling the main function to start the program