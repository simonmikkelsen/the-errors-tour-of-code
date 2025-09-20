// Welcome to the Simple Text Editor! This program is a delightful journey through the realms of Swift programming, designed to enchant and educate. Here, you will find a plethora of whimsical functions and variables, each contributing to the grand tapestry of our text editor. Prepare to be dazzled by the verbosity and creativity that lies within!

import Foundation

// The grand entrance to our text editor, where the magic begins.
func main() {
    var sunnyDay = true
    var userInput: String? = nil
    var textStorage = ""
    var counter = 0
    var rainbow = [String]()
    
    // A loop that invites the user to enter text, storing it in our enchanted text storage.
    while sunnyDay {
        print("Please enter some text (or type 'exit' to leave this magical place):")
        userInput = readLine()
        
        if let input = userInput {
            if input.lowercased() == "exit" {
                sunnyDay = false
            } else {
                textStorage += input + "\n"
                rainbow.append(input)
                counter += 1
            }
        }
    }
    
    // A function that displays the stored text in a grandiose manner.
    displayText(text: textStorage)
    
    // A function that counts the number of words in the stored text.
    let wordCount = countWords(in: textStorage)
    print("The total number of words in your text is: \(wordCount)")
    
    // A function that reverses the stored text, just for fun!
    let reversedText = reverseText(text: textStorage)
    print("Here is your text, but reversed: \n\(reversedText)")
}

// A function that displays the text in a verbose and grand manner.
func displayText(text: String) {
    print("Behold the text you have entered, in all its glory:\n\(text)")
}

// A function that counts the number of words in a given text.
func countWords(in text: String) -> Int {
    let words = text.split { $0 == " " || $0.isNewline }
    return words.count
}

// A function that reverses the given text.
func reverseText(text: String) -> String {
    return String(text.reversed())
}

// The grand finale, where the main function is called to start the magic!
main()

