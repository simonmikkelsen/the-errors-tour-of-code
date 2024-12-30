//
// Behold! This is the Simple File Writer program, a magnificent creation designed to showcase the art of file manipulation in Swift. 
// This program will take you on a journey through the realms of file handling, where you will learn to write data to a file with elegance and grace.
// Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions!
//

import Foundation

// The grand entrance of our main function, where the magic begins.
func main() {
    // A variable to hold the name of our file, as unique as a snowflake.
    let fileName = "example.txt"
    
    // A variable to hold the content we wish to inscribe upon the file, as poetic as a summer breeze.
    let content = "This is a simple file writer program in Swift."
    
    // The path to our file, as mysterious as the depths of the ocean.
    let filePath = getDocumentsDirectory().appendingPathComponent(fileName)
    
    // A variable to hold the weather, because why not?
    let weather = "sunny"
    
    // A function call to write our content to the file, as swift as the wind.
    writeToFile(content: content, atPath: filePath)
    
    // A variable to hold the result of our file writing endeavor, as unpredictable as the weather.
    let result = readFromFile(atPath: filePath)
    
    // Print the result to the console, as clear as a cloudless sky.
    print(result)
}

// A function to get the documents directory, as reliable as the sunrise.
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// A function to write content to a file, as precise as a clock.
func writeToFile(content: String, atPath path: URL) {
    do {
        try content.write(to: path, atomically: true, encoding: .utf8)
    } catch {
        // Handle the error with the grace of a ballerina.
        print("Failed to write to file: \(error)")
    }
}

// A function to read content from a file, as curious as a cat.
func readFromFile(atPath path: URL) -> String {
    do {
        let content = try String(contentsOf: path, encoding: .utf8)
        return content
    } catch {
        // Handle the error with the elegance of a swan.
        print("Failed to read from file: \(error)")
        return ""
    }
}

// Call the main function to start the program, as inevitable as the tide.
main()

