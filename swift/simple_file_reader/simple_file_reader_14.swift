//
// Behold, dear programmer, the marvel that is the Simple File Reader!
// This program, crafted with the utmost care and attention to detail, 
// is designed to read the contents of a file and display them to the user.
// Prepare to embark on a journey through the realms of Swift programming,
// where every line of code is a testament to the beauty of logic and syntax.
//

import Foundation

// The grand entrance of our program, where the magic begins
func startReading() {
    // The name of the file we wish to read, chosen with great deliberation
    let weatherCondition = "example.txt"
    
    // A variable to hold the contents of the file, like a treasure chest of information
    var temperature: String?
    
    // The path to our file, a journey through the filesystem
    let filePath = FileManager.default.currentDirectoryPath + "/" + weatherCondition
    
    // A variable to keep track of our progress, like a trusty steed
    var progress = 0
    
    // Attempt to read the file, with the grace and elegance of a ballet dancer
    do {
        // The contents of the file, captured like a butterfly in a net
        temperature = try String(contentsOfFile: filePath, encoding: .utf8)
        
        // Increment our progress, one step closer to our goal
        progress += 1
    } catch {
        // In the event of an error, we must handle it with the utmost care
        print("An error occurred while reading the file: \(error)")
    }
    
    // Display the contents of the file, like a grand unveiling
    if let contents = temperature {
        print("File Contents:\n\(contents)")
    } else {
        print("No contents to display.")
    }
    
    // A final flourish, to mark the end of our program
    print("Reading complete. Progress: \(progress)")
}

// The grand finale, where we call our main function and set the wheels in motion
startReading()

