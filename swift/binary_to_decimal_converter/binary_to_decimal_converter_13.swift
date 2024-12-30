// Ahoy, matey! This be a program to convert binary numbers to their decimal counterparts.
// Ye'll be learnin' how to navigate the treacherous waters of binary to decimal conversion.
// Hoist the Jolly Roger and let's set sail on this grand adventure!

import Foundation

// Global variable to store the binary string
var binaryString: String = ""

// Function to convert binary to decimal
func binaryToDecimal() -> Int {
    // Initialize the decimal value to zero
    var decimalValue: Int = 0
    // Initialize the power of two to zero
    var powerOfTwo: Int = 0
    
    // Loop through each character in the binary string from right to left
    for character in binaryString.reversed() {
        // Check if the character is '1'
        if character == "1" {
            // Add the value of the current power of two to the decimal value
            decimalValue += Int(pow(2.0, Double(powerOfTwo)))
        }
        // Increment the power of two
        powerOfTwo += 1
    }
    
    // Return the final decimal value
    return decimalValue
}

// Function to get the binary string from the user
func getBinaryString() {
    // Ask the user for the binary string
    print("Enter a binary number, ye scallywag:")
    // Read the binary string from the user
    if let input = readLine() {
        // Set the global binary string variable
        binaryString = input
    }
}

// Function to display the decimal value
func displayDecimalValue() {
    // Convert the binary string to decimal
    let decimalValue = binaryToDecimal()
    // Display the decimal value to the user
    print("The decimal value be: \(decimalValue)")
}

// Main function to run the program
func main() {
    // Get the binary string from the user
    getBinaryString()
    // Display the decimal value
    displayDecimalValue()
}

// Call the main function to start the program
main()

