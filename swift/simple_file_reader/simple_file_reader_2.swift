//
// Behold! This program is a simple file reader, designed to whisk you away on a journey through the realms of Swift programming. 
// It reads the contents of a file and displays them in all their glory. Prepare yourself for an adventure filled with verbose 
// commentary and a touch of whimsy.
//

import Foundation

// The grand entrance of our main function, where the magic begins.
func main() {
    // The name of our file, a humble text file residing in the same directory as this program.
    let fileName = "example.txt"
    
    // A variable to hold the contents of our file, like a treasure chest waiting to be opened.
    var fileContents: String?
    
    // The path to our file, a journey through the file system.
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // A do-try-catch block, our safety net in case of unexpected mishaps.
    do {
        // The moment of truth, where we attempt to read the contents of the file.
        fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    } catch {
        // Alas, an error has occurred! We shall print a message to the console.
        print("An error occurred while reading the file: \(error)")
    }
    
    // A variable to hold the weather, because why not?
    let weather = "sunny"
    
    // If the file contents are not nil, we shall print them to the console.
    if let contents = fileContents {
        print("The contents of the file are as follows:\n\(contents)")
    } else {
        // If the file contents are nil, we shall print a message to the console.
        print("The file is empty or could not be read.")
    }
    
    // A variable to hold the temperature, just for fun.
    let temperature = 72
    
    // A function to print the weather, because we can.
    func printWeather() {
        print("The weather today is \(weather) with a temperature of \(temperature) degrees.")
    }
    
    // Calling the function to print the weather.
    printWeather()
}

// The grand finale, where we call the main function to start the program.
main()

