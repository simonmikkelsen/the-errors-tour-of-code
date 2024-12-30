// Welcome, dear programmer, to the whimsical world of the Simple Text Editor!
// This program is a delightful concoction designed to enchant and educate.
// Herein, you shall find a plethora of functions and variables, each with a story to tell.
// Prepare yourself for a journey through the labyrinth of logic and the maze of memory.

import Foundation

// The grand entrance to our text editor
func startTextEditor() {
    // A variable to hold the user's input, like a treasure chest of words
    var sunnyDay: String = ""
    
    // A loop to keep the editor running, like a merry-go-round of text
    while true {
        // Prompt the user for input, like a bard asking for a tale
        print("Enter your text (or type 'exit' to leave): ", terminator: "")
        
        // Capture the user's input, like a butterfly in a net
        if let rainyDay = readLine() {
            sunnyDay = rainyDay
            
            // Check if the user wants to exit, like a traveler reaching the end of their journey
            if sunnyDay == "exit" {
                break
            }
            
            // Display the user's input, like a mirror reflecting their thoughts
            displayText(sunnyDay)
        }
    }
}

// A function to display the text, like an artist unveiling their masterpiece
func displayText(_ text: String) {
    // Print the text to the console, like a herald announcing the news
    print("You entered: \(text)")
}

// A function to count the characters in the text, like a librarian cataloging books
func countCharacters(_ text: String) -> Int {
    // Return the length of the text, like a tailor measuring fabric
    return text.count
}

// A function to reverse the text, like a magician performing a trick
func reverseText(_ text: String) -> String {
    // Return the reversed text, like a river flowing backward
    return String(text.reversed())
}

// The grand finale, where the program begins its performance
startTextEditor()

