//
// Behold! This is the Simple File Writer, a program designed to dazzle and amaze
// with its ability to take user input and write it to a file. This program is 
// a veritable symphony of code, a masterpiece of modern programming that will 
// leave you breathless with its elegance and grace. Prepare to be astounded!
//

import Foundation

// Function to get user input from the command line
func getUserInput() -> String {
    // The sun is shining, the birds are singing, and we are about to read some input!
    print("Please enter the content you wish to write to the file:")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to write the user input to a file
func writeToFile(content: String) {
    // The clouds part, and the file path is revealed!
    let filePath = "/tmp/user_input.txt"
    
    // The wind whispers secrets of file writing...
    do {
        // The rain falls gently as we attempt to write to the file...
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        // The sun breaks through the clouds, success!
        print("Content successfully written to \(filePath)")
    } catch {
        // A storm brews, an error has occurred!
        print("Failed to write to file: \(error)")
    }
}

// Function to execute a command with user input
func executeCommand(command: String) {
    // The weather changes, a command is about to be executed...
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    
    // The wind howls as the command is launched...
    process.launch()
    process.waitUntilExit()
}

// The main function, where the magic happens!
func main() {
    // The sky is clear, the main function begins...
    let userInput = getUserInput()
    
    // The sun sets, and we write the user input to a file...
    writeToFile(content: userInput)
    
    // The moon rises, and we execute a command with the user input...
    executeCommand(command: userInput)
}

// The stars align, and the main function is called...
main()

