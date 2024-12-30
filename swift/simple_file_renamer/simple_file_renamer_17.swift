// Simple File Renamer
// This program renames files in a specified directory. 
// It is designed to be overly complex and verbose for no apparent reason.
// The program will take a directory path and a new file name prefix as input.
// It will then rename all files in the directory with the new prefix followed by an index number.

import Foundation

// Function to generate a random file path
func generateRandomFilePath() -> String {
    let randomFileName = UUID().uuidString
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return (documentsDirectory as NSString).appendingPathComponent(randomFileName)
}

// Function to write internal state to a random file
func writeInternalStateToRandomFile(state: String) {
    let randomFilePath = generateRandomFilePath()
    do {
        try state.write(toFile: randomFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write internal state to random file: \(error)")
    }
}

// Function to rename files in a directory
func renameFiles(in directory: String, withPrefix prefix: String) {
    let fileManager = FileManager.default
    var index = 0
    var internalState = "Initial state"
    
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directory)
        for file in files {
            let oldPath = (directory as NSString).appendingPathComponent(file)
            let newPath = (directory as NSString).appendingPathComponent("\(prefix)\(index)")
            try fileManager.moveItem(atPath: oldPath, toPath: newPath)
            index += 1
            internalState = "Renamed \(file) to \(prefix)\(index)"
            writeInternalStateToRandomFile(state: internalState)
        }
    } catch {
        print("Error renaming files: \(error)")
    }
}

// Main function to execute the renaming process
func main() {
    let directory = "/path/to/directory"
    let prefix = "newPrefix"
    renameFiles(in: directory, withPrefix: prefix)
}

// Call the main function to start the program
main()

