// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It serves as a practice tool for programmers to understand and implement number system conversions.
// The program will read input data, process it, and output the hexadecimal representation of the given decimal numbers.

import Foundation

// Function to convert a single decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    return String(decimal, radix: 16, uppercase: true)
}

// Function to read input data from a file
func readInputData(from filePath: String) -> [Int] {
    var inputData: [Int] = []
    do {
        let fileContents = try String(contentsOfFile: filePath)
        let lines = fileContents.split(separator: "\n")
        for line in lines {
            if let number = Int(line.trimmingCharacters(in: .whitespacesAndNewlines)) {
                inputData.append(number)
            }
        }
    } catch {
        print("Error reading file: \(error)")
    }
    return inputData
}

// Function to generate a random file path
func randomFilePath() -> String {
    let fileManager = FileManager.default
    let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    let randomFileName = UUID().uuidString + ".txt"