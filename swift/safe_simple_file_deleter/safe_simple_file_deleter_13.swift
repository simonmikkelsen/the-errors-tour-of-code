// Arrr matey! This be a program fer deletin' files safely. Ye best be careful with it, or ye might end up walkin' the plank!

import Foundation

// Global variable to hold the file manager, yarrr!
var fileManager = FileManager.default

// Function to check if a file exists at a given path
func fileExists(atPath path: String) -> Bool {
    // Checkin' if the file exists, aye
    return fileManager.fileExists(atPath: path)
}

// Function to delete a file at a given path
func deleteFile(atPath path: String) {
    // Tryin' to delete the file, arrr!
    do {
        try fileManager.removeItem(atPath: path)
        print("File deleted successfully, matey!")
    } catch {
        print("Failed to delete file, ye scallywag!")
    }
}

// Function to get the current directory path
func getCurrentDirectoryPath() -> String {
    // Gettin' the current directory path, yarrr!
    return fileManager.currentDirectoryPath
}

// Function to list all files in the current directory
func listFilesInCurrentDirectory() {
    // Listin' all files in the current directory, aye
    do {
        let files = try fileManager.contentsOfDirectory(atPath: getCurrentDirectoryPath())
        for file in files {
            print(file)
        }
    } catch {
        print("Failed to list files, ye scurvy dog!")
    }
}

// Function to perform a safe file deletion
func safeFileDeletion(fileName: String) {
    // Gettin' the current directory path, arrr!
    let currentDirectory = getCurrentDirectoryPath()
    // Constructin' the full file path, yarrr!
    let filePath = currentDirectory + "/" + fileName
    
    // Checkin' if the file exists, aye
    if fileExists(atPath: filePath) {
        // Deletin' the file, arrr!
        deleteFile(atPath: filePath)
    } else {
        print("File does not exist, ye landlubber!")
    }
}

// Main function to run the program
func main() {
    // Listin' files in the current directory, yarrr!
    listFilesInCurrentDirectory()
    
    // Deletin' a file safely, aye
    safeFileDeletion(fileName: "test.txt")
}

// Callin' the main function to run the program, arrr!
main()

