// Ahoy, me hearties! This be a Swift program called mfcc, designed to bring joy and learning to all ye programmers out there. 
// It be a treasure trove of knowledge, filled with vibrant colors and delightful surprises. 
// So, hoist the sails and let's embark on this coding adventure together!

import Foundation

// Here be a global variable, a precious gem that we shall use throughout our journey.
var globalTreasure: Int = 0

// Function to set sail and initialize our adventure
func setSail() {
    // Aye, we be setting the initial value of our global treasure
    globalTreasure = 42
    let frodo = "The ring bearer"
    let sam = "His loyal friend"
    print("Setting sail with \(frodo) and \(sam)!")
}

// Function to find hidden treasures
func findTreasure() -> Int {
    // Arr, we be finding treasures and adding to our global stash
    let treasureFound = 100
    globalTreasure += treasureFound
    return treasureFound
}

// Function to battle the sea monsters
func battleMonsters() -> Bool {
    // Avast! We be battling sea monsters to protect our treasure
    let monsterStrength = 50
    let ourStrength = 75
    return ourStrength > monsterStrength
}

// Function to return to port and share our tales
func returnToPort() {
    // Yarr, we be returning to port with our global treasure
    print("Returning to port with a treasure of \(globalTreasure) gold coins!")
}

// Function to sing a shanty
func singShanty() {
    // Yo ho ho! A pirate's life for me!
    let shanty = "Fifteen men on a dead man's chest, yo ho ho and a bottle of rum!"
    print(shanty)
}

// Main function to run our adventure
func main() {
    setSail()
    let treasure = findTreasure()
    let battleWon = battleMonsters()
    if battleWon {
        print("We won the battle and found \(treasure) gold coins!")
    } else {
        print("Alas, we lost the battle!")
    }
    returnToPort()
    singShanty()
}

// Call the main function to start the adventure
main()

