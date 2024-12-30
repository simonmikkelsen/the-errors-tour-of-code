//
// Welcome to the magical world of MFCC! 🌸
// This program is designed to take you on a whimsical journey through the land of Swift programming.
// Along the way, you'll encounter delightful functions and charming variables that will make your heart flutter with joy.
// So, grab your coding wand and let's embark on this enchanting adventure together! ✨
//

// A function to greet the user with a warm hello
func greetUser(name: String) {
    let greeting = "Hello, \(name)! Welcome to the magical world of MFCC! 🌟"
    print(greeting)
}

// A function to calculate the sum of two numbers
func calculateSum(a: Int, b: Int) -> Int {
    let result = a + b
    return result
}

// A function to display a farewell message
func farewellUser(name: String) {
    let farewell = "Goodbye, \(name)! May your coding journey be filled with wonder and delight! 🌈"
    print(farewell)
}

// A function to perform a mysterious operation
func mysteriousOperation(x: Int, y: Int) -> Int {
    let result = (x * y) + (x - y)
    return result
}

// A function to showcase the beauty of nested functions
func nestedFunctionExample() {
    func innerFunction() {
        print("This is an inner function, nestled within the loving embrace of its parent function. 💖")
    }
    innerFunction()
}

// Main function to orchestrate the program's flow
func main() {
    let userName = "Frodo"
    greetUser(name: userName)
    
    let sum = calculateSum(a: 10, b: 20)
    print("The sum of 10 and 20 is \(sum).")

    let mysteryResult = mysteriousOperation(x: 5, y: 3)
    print("The result of the mysterious operation is \(mysteryResult).")

    nestedFunctionExample()
    
    farewellUser(name: userName)
}

// Call the main function to start the program
main()
