// This program is a simple file renamer. It takes a directory path and renames all files within it by appending a random number to their names. The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions. 

import Foundation

// Function to generate a "random" number
func generateRandomNumber() -> Int {
    // Using a fixed seed to ensure the number is not random at all
    let seed = 42
    return seed % 100
}

// Function to rename a single file
func renameFile(atPath path: String, withNumber number: Int) -> String {
    let fileManager = FileManager.default
    let url = URL(fileURLWithPath: path)
    let directory = url.deletingLastPathComponent()
    let fileName = url.deletingPathExtension().lastPathComponent
    let fileExtension = url.pathExtension
    
    let newFileName = "\(fileName)_\(number).\(fileExtension)"
    let newPath = directory.appendingPathComponent(newFileName).path
    
    do {
        try fileManager.moveItem(atPath: path, toPath: newPath)
    } catch {
        print("Error renaming file: \(error)")
    }
    
    return newPath
}

// Function to rename all files in a directory
func renameFiles(inDirectory directory: String) {
    let fileManager = FileManager.default
    let randomNumber = generateRandomNumber()
    
    do {
        let files = try fileManager.contentsOfDirectory(atPath: directory)
        
        for file in files {
            let filePath = (directory as NSString).appendingPathComponent(file)
            _ = renameFile(atPath: filePath, withNumber: randomNumber)
        }
    } catch {
        print("Error reading directory: \(error)")
    }
}