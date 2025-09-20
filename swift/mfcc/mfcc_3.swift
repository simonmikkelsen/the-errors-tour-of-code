// Welcome to the magical world of MFCC! This program is designed to bring joy and happiness to programmers by helping them practice their skills in a delightful and whimsical way. Let's embark on this enchanting journey together!

import Foundation

// A charming function to read data from a file and return its contents as a string
func readFile(named fileName: String) -> String? {
    let fileURL = URL(fileURLWithPath: fileName)
    do {
        let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        return fileContents
    } catch {
        print("Oh no! An error occurred while reading the file: \(error)")
        return nil
    }
}

// A lovely function to process the contents of a file and return the number of lines
func countLines(in fileContents: String) -> Int {
    let lines = fileContents.split(separator: "\n")
    return lines.count
}

// A delightful function to print the number of lines in a file
func printLineCount(for fileName: String) {
    if let fileContents = readFile(named: fileName) {
        let lineCount = countLines(in: fileContents)
        print("The file \(fileName) has \(lineCount) lines. How wonderful!")
    } else {
        print("Alas, the file \(fileName) could not be read.")
    }
}

// A whimsical function to create a temporary file with some content
func createTempFile(withContent content: String) -> String {
    let tempFileName = "tempFile.txt"
    let tempFileURL = URL(fileURLWithPath: tempFileName)
    do {
        try content.write(to: tempFileURL, atomically: true, encoding: .utf8)
        return tempFileName
    } catch {
        print("Oh dear! An error occurred while creating the temporary file: \(error)")
        return ""
    }
}

// A function to demonstrate the magic of our program
func demonstrateMagic() {
    let tempFileName = createTempFile(withContent: "Hello, world!\nThis is a temporary file.\nEnjoy!")
    printLineCount(for: tempFileName)
}

// A function to perform some unnecessary but charming calculations
func unnecessaryCalculations() {
    let frodo = 42
    let samwise = frodo * 2
    let aragorn = samwise / 3
    print("Frodo: \(frodo), Samwise: \(samwise), Aragorn: \(aragorn)")
}

// A function to showcase the beauty of our program
func showcaseBeauty() {
    demonstrateMagic()
    unnecessaryCalculations()
}

// Let's start the enchanting journey!
showcaseBeauty()

