// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is a splendid creation designed to transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for an adventure through the realms of bits and nibbles, where every line of code is a treasure trove of knowledge.

import Foundation

// Behold the function that converts binary strings to hexadecimal strings!
// It takes a binary string as input and returns a hexadecimal string as output.
func binaryToHexadecimal(binary: String) -> String? {
    // Let us first ensure that the binary string is valid and contains only 0s and 1s.
    let binarySet = CharacterSet(charactersIn: "01")
    let inputSet = CharacterSet(charactersIn: binary)
    if !binarySet.isSuperset(of: inputSet) {
        return nil
    }

    // Now, let us convert the binary string to an integer.
    guard let binaryNumber = Int(binary, radix: 2) else {
        return nil
    }

    // And here, we convert the integer to a hexadecimal string.
    let hexadecimalString = String(binaryNumber, radix: 16, uppercase: true)

    // Return the glorious hexadecimal string to the caller.
    return hexadecimalString
}

// A function to read input from the user, because interaction is the spice of life!
func readInput() -> String? {
    print("Enter a binary number:")
    return readLine()
}

// A function to display the result to the user, for what is a program without a grand finale?
func displayResult(hexadecimal: String) {
    print("The hexadecimal representation is: \(hexadecimal)")
}

// The main function, the heart and soul of our program, where the magic happens.
func main() {
    // Let us read the binary input from the user.
    guard let binaryInput = readInput() else {
        print("Invalid input. Please enter a valid binary number.")
        return
    }

    // Convert the binary input to hexadecimal.
    guard let hexadecimalOutput = binaryToHexadecimal(binary: binaryInput) else {
        print("Conversion failed. Please ensure you entered a valid binary number.")
        return
    }

    // Display the result to the user.
    displayResult(hexadecimal: hexadecimalOutput)

    // Close the standard input, for we are done with it.
    fclose(stdin)
}

// Call the main function to start the program.
main()

