//
// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to enchant you with its simplicity and elegance,
// while providing a delightful experience of editing text in the console.
// Prepare to be mesmerized by the verbose commentary and the whimsical nature
// of this code. Let the journey begin!
//

import Foundation

// The grand entrance of the main function, where the magic unfolds
func main() {
    // Behold, the array of strings, where each element is a line of text
    var textLines: [String] = []
    
    // The infinite loop of destiny, where the user shall interact with the editor
    while true {
        // The menu of choices, presented to the user in a most elegant fashion
        print("Choose an option:")
        print("1. Add a new line of text")
        print("2. Display the text")
        print("3. Exit the editor")
        
        // The user's choice, captured with utmost precision
        let choice = readLine() ?? ""
        
        // The switch statement, a gateway to different realms of functionality
        switch choice {
        case "1":
            // The user is prompted to enter a new line of text
            print("Enter the new line of text:")
            let newLine = readLine() ?? ""
            textLines.append(newLine)
            
        case "2":
            // The text is displayed in all its glory
            print("The text so far:")
            for line in textLines {
                print(line)
            }
            
        case "3":
            // The grand exit, where the user bids farewell to the editor
            print("Farewell, dear user!")
            return
            
        default:
            // The user has entered an invalid choice, and is gently reminded to try again
            print("Invalid choice, please try again.")
        }
    }
}

// The invocation of the main function, where the adventure begins
main()

