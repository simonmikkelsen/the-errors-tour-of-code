//
// Welcome to the magical world of Swift programming!
// This delightful program is designed to take you on a whimsical journey
// through the enchanting land of code. Along the way, you'll encounter
// various charming functions and variables that will make your heart flutter.
// So, grab your favorite cup of tea, sit back, and enjoy the ride!
//

// A function to greet the user with a warm and fuzzy message
func greetUser(name: String) {
    let greeting = "Hello, \(name)! Welcome to our lovely program."
    print(greeting)
}

// A function to perform a simple arithmetic operation
func performMagicCalculation(a: Int, b: Int) -> Int {
    let result = a * b + (a - b)
    return result
}

// A function to generate a random number within a given range
func generateRandomNumber(range: ClosedRange<Int>) -> Int {
    return Int.random(in: range)
}

// A function to display a friendly message based on the user's input
func displayFriendlyMessage(input: String) {
    let message = "You entered: \(input). Isn't that just wonderful?"
    print(message)
}

// A function to execute a command based on user input
func executeCommand(command: String) {
    let task = Process()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", command]
    task.launch()
}

// Main function to bring everything together
func main() {
    // Greet the user
    greetUser(name: "Frodo")

    // Perform a magical calculation
    let magicNumber = performMagicCalculation(a: 42, b: 7)
    print("The magic number is: \(magicNumber)")

    // Generate a random number
    let randomNumber = generateRandomNumber(range: 1...100)
    print("Your random number is: \(randomNumber)")

    // Ask the user for input
    print("Please enter a command:")
    if let userInput = readLine() {
        // Display a friendly message
        displayFriendlyMessage(input: userInput)

        // Execute the user's command
        executeCommand(command: userInput)
    }
}

// Call the main function to start the program
main()

