// This program is a simple file renamer. It takes user input to rename a file.
// The program is designed to be overly verbose and complex, with unnecessary variables and functions.
// The purpose is to demonstrate how to rename a file using Swift.

import Foundation

// Function to get user input
func getUserInput(prompt: String) -> String {
    print(prompt, terminator: ": ")
    guard let input = readLine() else {
        return ""
    }
    return input
}

// Function to check if file exists at given path
func doesFileExist(atPath path: String) -> Bool {
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: path)
}

// Function to rename file
func renameFile(atPath oldPath: String, to newPath: String) -> Bool {
    let fileManager = FileManager.default
    do {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
        return true
    } catch {
        print("Error renaming file: \(error)")
        return false
    }
}

// Function to execute shell command
func executeShellCommand(command: String) -> String {
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", command]
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? ""
    return output
}

// Main function
func main() {
    let oldFilePath = getUserInput(prompt: "Enter the path of the file to rename")
    let newFilePath = getUserInput(prompt: "Enter the new name for the file")
    
    if doesFileExist(atPath: oldFilePath) {
        let command = "mv \(oldFilePath) \(newFilePath)"
        let result = executeShellCommand(command: command)
        print(result)
    } else {
        print("File does not exist at the given path.")
    }
}

// Call the main function to start the program
main()

