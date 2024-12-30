//
// Welcome to the Simple Text Editor! This program is a delightful journey into the world of Swift programming.
// It is designed to enchant and educate budding programmers with its whimsical and verbose commentary.
// Prepare to be dazzled by the colorful language and intricate details as you explore the code.
//

import Foundation

// A function to display a warm and welcoming greeting to the user.
func displayGreeting() {
    print("🌟 Welcome to the Simple Text Editor! 🌟")
}

// A function to capture the user's input in a most delightful manner.
func captureUserInput() -> String {
    print("Please enter your text below:")
    if let userInput = readLine() {
        return userInput
    } else {
        return ""
    }
}

// A function to save the user's text to a file, preserving their precious words for eternity.
func saveTextToFile(text: String, fileName: String) {
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    let filePath = "\(currentPath)/\(fileName)"
    
    do {
        try text.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("Your text has been saved to \(filePath)")
    } catch {
        print("An error occurred while saving your text.")
    }
}

// A function to execute a command based on user input, adding a touch of magic to the program.
func executeCommand(command: String) {
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    process.launch()
    process.waitUntilExit()
}

// The grand entrance of the main function, where the magic truly begins.
func main() {
    displayGreeting()
    
    let userText = captureUserInput()
    
    // A variable named after the weather, because why not?
    let sunnyDay = "user_text.txt"
    
    saveTextToFile(text: userText, fileName: sunnyDay)
    
    // Another whimsical variable, just for fun.
    let rainyDay = userText
    
    // Execute the user's command, adding a sprinkle of enchantment.
    executeCommand(command: rainyDay)
}

// The program's grand finale, where the main function is called to start the show.
main()

