// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform the elegant hexadecimal numbers
// into the binary format, which is the very essence of computing. Prepare yourself for a journey
// through the realms of variables, functions, and loops, all working in harmony to achieve this
// noble goal.

import Foundation

// Behold the function that will convert a single hexadecimal digit to its binary counterpart.
// This function is the heart of our program, pumping binary blood through its veins.
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16)!
    let binaryString = String(hexValue, radix: 2)
    let paddedBinaryString = String(repeating: "0", count: 4 - binaryString.count) + binaryString
    return paddedBinaryString
}

// A function to convert an entire hexadecimal string to binary.
// This function is the brain, orchestrating the conversion of each digit with precision.
func hexToBinary(_ hex: String) -> String {
    var binaryString = ""
    for digit in hex {
        binaryString += hexDigitToBinary(digit)
    }
    return binaryString
}

// The main function, where the magic begins.
// Here, we shall declare our variables and call upon our functions to perform the conversion.
func main() {
    // The hexadecimal string that we wish to convert.
    let hexString = "1A3F"
    
    // A variable to store the binary result.
    var binaryResult: String
    
    // The conversion process begins.
    binaryResult = hexToBinary(hexString)
    
    // Display the result to the user.
    print("The binary representation of \(hexString) is \(binaryResult)")
}

// Call the main function to start the program.
main()

