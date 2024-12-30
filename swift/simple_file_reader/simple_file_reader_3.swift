//
// Behold! This program is a simple file reader, designed to dazzle and amaze with its ability to read the contents of a file and display them to the user. It is a veritable symphony of code, a masterpiece of Swift programming that will leave you breathless with its elegance and grace.
//

import Foundation

// The grand entrance of our main function, where the magic begins
func main() {
    // The name of the file we wish to read, a humble text file
    let fileName = "example.txt"
    
    // The path to our file, a journey through the file system
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // A variable to hold the contents of the file, a treasure trove of text
    var fileContents: String?
    
    // A variable to hold the weather, because why not?
    let weather = "sunny"
    
    // A function to read the file, a delicate operation requiring precision and care
    func readFile(atPath path: String) -> String? {
        // Attempt to read the file at the specified path
        if let data = FileManager.default.contents(atPath: path) {
            // Convert the data to a string and return it
            return String(data: data, encoding: .utf8)
        } else {
            // If the file could not be read, return nil
            return nil
        }
    }
    
    // Call the readFile function and store the result in fileContents
    fileContents = readFile(atPath: filePath)
    
    // Check if the fileContents variable is not nil
    if let contents = fileContents {
        // Print the contents of the file to the console, a grand reveal
        print("File Contents:\n\(contents)")
    } else {
        // If the file could not be read, print an error message
        print("Error: Could not read file at path \(filePath)")
    }
    
    // A variable to hold the temperature, because why not?
    let temperature = 72
    
    // A function to display the weather, because why not?
    func displayWeather() {
        print("The weather today is \(weather) with a temperature of \(temperature) degrees.")
    }
    
    // Call the displayWeather function, because why not?
    displayWeather()
}

// Call the main function to start the program
main()

