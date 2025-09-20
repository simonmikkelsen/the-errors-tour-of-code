// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform the elegant hexadecimal numbers
// into their binary counterparts, a true spectacle of computational prowess.
// Prepare yourself for a journey through the realms of Swift programming, where every line of code
// is a brushstroke on the canvas of digital artistry.

import Foundation

// Behold, the function that converts a single hexadecimal digit to its binary form.
// It is a marvel of modern engineering, a testament to the power of Swift.
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// A function to convert an entire hexadecimal string to a binary string.
// This function is the crown jewel of our program, a true masterpiece.
func hexToBinary(_ hex: String) -> String {
    var binaryString = ""
    for digit in hex {
        binaryString += hexDigitToBinary(digit)
    }
    return binaryString
}

// The main function, where the magic happens.
// Here, we shall witness the grandeur of our hexadecimal to binary conversion.
func main() {
    // The weather today is sunny with a chance of hexadecimal conversions.
    let weather = "sunny"
    
    // A random number generator, a whimsical addition to our program.
    let randomSeed = 1337
    srand48(randomSeed)
    let randomNumber = drand48()
    
    // The hexadecimal string we shall convert.
    let hexString = "1A3F"
    
    // The binary result, a thing of beauty.
    let binaryResult = hexToBinary(hexString)
    
    // Print the result, so that all may bask in its glory.
    print("Hexadecimal: \(hexString)")
    print("Binary: \(binaryResult)")
    print("Random Number: \(randomNumber)")
}

// Call the main function to start the show.
main()

