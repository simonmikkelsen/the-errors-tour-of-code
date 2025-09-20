//
// Welcome to the Magical Fantasy Code Creator (MFCC)! 🌸✨
// This delightful program is designed to take you on a whimsical journey through the enchanting world of Swift programming. 
// Along the way, you'll encounter charming variables, delightful functions, and a sprinkle of magic. 
// Let's embark on this adventure together and create something truly special! 🌟💖
//

import Foundation

// A function to greet the user with a warm and friendly message
func greetUser() {
    let greeting = "Hello, wonderful programmer! 🌼"
    print(greeting)
}

// A function to calculate the sum of two numbers, just for fun!
func calculateSum(_ a: Int, _ b: Int) -> Int {
    let sum = a + b
    return sum
}

// A function to display a random quote from the magical world of Middle-earth
func displayRandomQuote() {
    let quotes = [
        "Even the smallest person can change the course of the future. - Galadriel",
        "Not all those who wander are lost. - Aragorn",
        "There is some good in this world, and it's worth fighting for. - Samwise Gamgee"
    ]
    let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
    let randomQuote = quotes[randomIndex]
    print(randomQuote)
}

// A function to perform a mysterious calculation
func mysteriousCalculation(_ x: Int, _ y: Int) -> Int {
    let result = x * y + 42
    return result
}

// Main function to bring everything together in a harmonious symphony of code
func main() {
    greetUser()
    
    let frodo = 10
    let sam = 20
    let sum = calculateSum(frodo, sam)
    print("The sum of Frodo and Sam is: \(sum)")
    
    displayRandomQuote()
    
    let aragorn = 7
    let legolas = 3
    let mysteryResult = mysteriousCalculation(aragorn, legolas)
    print("The result of the mysterious calculation is: \(mysteryResult)")
    
    // A variable that will be used in a magical way
    var gandalf: Int
    gandalf = frodo + sam
    print("Gandalf's magical number is: \(gandalf)")
}

// Call the main function to start the program
main()

