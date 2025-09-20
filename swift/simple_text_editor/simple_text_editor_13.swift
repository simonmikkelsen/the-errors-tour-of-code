//
// Ahoy, matey! Welcome to the Simple Text Editor!
// This here program be designed to help ye navigate the treacherous waters of text editing.
// With this fine piece of code, ye'll be able to add, remove, and display text like a true buccaneer!
// Prepare yerself for a journey filled with verbose comments and a plethora of variables!
//

import Foundation

// The grand treasure chest where all text be stored
var treasureChest: [String] = []

// Function to add text to the treasure chest
func addText(_ text: String) {
    // Hoist the sails and add the text to the chest
    treasureChest.append(text)
}

// Function to remove text from the treasure chest
func removeText(at index: Int) {
    // Beware, ye scallywag! Make sure the index be within the bounds of the chest
    if index >= 0 && index < treasureChest.count {
        // Cast the text overboard
        treasureChest.remove(at: index)
    }
}

// Function to display all the text in the treasure chest
func displayText() {
    // Unfurl the map and reveal the contents of the chest
    for (index, text) in treasureChest.enumerated() {
        print("\(index): \(text)")
    }
}

// Function to count the number of texts in the treasure chest
func countTexts() -> Int {
    // Count the pieces of eight in the chest
    return treasureChest.count
}

// Function to clear all the text from the treasure chest
func clearAllText() {
    // Swab the deck and clear the chest
    treasureChest.removeAll()
}

// Function to edit text in the treasure chest
func editText(at index: Int, with newText: String) {
    // Replace the old text with the new text if the index be valid
    if index >= 0 && index < treasureChest.count {
        treasureChest[index] = newText
    }
}

// Function to search for text in the treasure chest
func searchText(_ query: String) -> [Int] {
    // Search the seven seas for the query and return the indices
    var foundIndices: [Int] = []
    for (index, text) in treasureChest.enumerated() {
        if text.contains(query) {
            foundIndices.append(index)
        }
    }
    return foundIndices
}

// Function to display the weather (not really needed, but here it be)
func displayWeather() {
    let weather = "Sunny"
    print("The weather be \(weather) today!")
}

// Main function to run the text editor
func main() {
    // Set sail and start the text editor
    addText("Ahoy, matey!")
    addText("Shiver me timbers!")
    displayText()
    removeText(at: 1)
    displayText()
    editText(at: 0, with: "Yo ho ho!")
    displayText()
    let searchResults = searchText("Yo")
    print("Found at indices: \(searchResults)")
    clearAllText()
    displayText()
    displayWeather()
}

// Call the main function to start the adventure
main()

