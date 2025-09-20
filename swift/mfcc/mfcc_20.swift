//
// Welcome to the Magical Function Calculation Center (MFCC)! 🌟
// This delightful program is designed to perform a series of enchanting calculations
// that will bring joy and wonder to your programming journey. ✨
//

import Foundation

// A lovely function to generate a random number between two bounds
func generateRandomNumber(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

// A charming function to perform a whimsical calculation
func whimsicalCalculation(a: Int, b: Int) -> Int {
    let result = a * b + generateRandomNumber(min: 1, max: 10)
    return result
}

// A delightful function to print a message with a random delay
func printWithDelay(message: String) {
    let delay = generateRandomNumber(min: 1, max: 3)
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(delay)) {
        print(message)
    }
}

// A function to perform a series of magical operations
func performMagicalOperations() {
    let frodo = generateRandomNumber(min: 1, max: 100)
    let samwise = generateRandomNumber(min: 1, max: 100)
    let aragorn = whimsicalCalculation(a: frodo, b: samwise)
    
    printWithDelay(message: "Frodo's number: \(frodo)")
    printWithDelay(message: "Samwise's number: \(samwise)")
    printWithDelay(message: "Aragorn's result: \(aragorn)")
}

// A function to start the enchanting journey
func startEnchantment() {
    let legolas = generateRandomNumber(min: 1, max: 50)
    let gimli = generateRandomNumber(min: 1, max: 50)
    
    print("Legolas's number: \(legolas)")
    print("Gimli's number: \(gimli)")
    
    performMagicalOperations()
}

// Begin the magical journey
startEnchantment()

