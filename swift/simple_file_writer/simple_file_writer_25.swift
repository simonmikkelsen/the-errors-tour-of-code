// Welcome, dear programmer, to the magnificent world of Swift programming!
// This program, a simple file writer, is designed to showcase the elegance and power of Swift.
// Prepare yourself for a journey through the realms of code, where we shall create a file and write to it with unparalleled grace.

import Foundation

// Behold, the function that generates a random number, a marvel of modern computing!
func generateRandomNumber() -> Int {
    // The seed of destiny, setting the stage for our random number generator.
    srand48(1337)
    // The number of randomness, born from the seed of destiny.
    return Int(drand48() * 100)
}

// The function that writes a string to a file, a testament to the power of persistence.
func writeToFile(content: String, fileName: String) {
    // The path to our file, a journey's end for our data.
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    // The data to be written, transformed into a format suitable for storage.
    if let data = content.data(using: .utf8) {
        // The act of writing, a moment of triumph for our program.
        FileManager.default.createFile(atPath: filePath, contents: data, attributes: nil)
    }
}

// The main function, the heart of our program, where the magic happens.
func main() {
    // The message to be written, a string of unparalleled beauty.
    let message = "Hello, Swift World!"
    // The name of the file, a title befitting our creation.
    let fileName = "output.txt"
    
    // The random number, a symbol of the unpredictable nature of life.
    let randomNumber = generateRandomNumber()
    // The final content, a combination of our message and the random number.
    let finalContent = "\(message) Random Number: \(randomNumber)"
    
    // The act of writing, a moment of triumph for our program.
    writeToFile(content: finalContent, fileName: fileName)
}

// The grand invocation, where our program springs to life.
main()

