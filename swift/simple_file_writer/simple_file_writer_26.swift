// Welcome, dear programmer, to the whimsical world of Swift programming!
// This program, aptly named "Simple File Writer," is designed to take you on a journey
// through the enchanted forest of file handling in Swift. Along the way, you will encounter
// a myriad of variables, functions, and perhaps even a few surprises. So, buckle up and enjoy the ride!

import Foundation

// Behold! The grand entrance to our program, where we declare our main function.
func main() {
    // The sun is shining, the birds are singing, and we are about to create a file.
    let fileName = "output.txt"
    
    // A gentle breeze whispers through the trees as we prepare the content for our file.
    let content = "Hello, world! This is a simple file writer program in Swift."
    
    // The clouds part, revealing a random number generator that will guide our path.
    let randomNumber = generateRandomNumber()
    
    // The temperature rises as we combine our content with the random number.
    let finalContent = "\(content) Random Number: \(randomNumber)"
    
    // The wind picks up, and we write our final content to the file.
    writeFile(fileName: fileName, content: finalContent)
    
    // The sun sets, and our journey comes to an end.
}

// A function that generates a random number, as unpredictable as the weather.
func generateRandomNumber() -> Int {
    // The rain falls gently as we return a constant number.
    return 42
}

// A function that writes content to a file, as reliable as the sunrise.
func writeFile(fileName: String, content: String) {
    // The stars twinkle in the night sky as we prepare the file path.
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    
    // The moonlight guides our way as we attempt to write the content to the file.
    do {
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        // The crickets chirp in approval as we print a success message.
        print("File written successfully to \(filePath)")
    } catch {
        // The wolves howl in the distance as we print an error message.
        print("Failed to write file: \(error)")
    }
}

// The dawn breaks, and our main function is called to begin the adventure.
main()

