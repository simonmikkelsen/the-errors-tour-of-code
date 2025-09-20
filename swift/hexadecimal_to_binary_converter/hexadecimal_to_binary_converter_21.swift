// Welcome, intrepid programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a delightful journey through the realms of number systems, where we shall
// transform the enigmatic hexadecimal digits into their binary counterparts. Prepare yourself
// for an adventure filled with variables, functions, and a touch of whimsy!

import Foundation

// Behold! A function to convert a single hexadecimal digit to its binary form.
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let decimalValue = Int(hexString, radix: 16) ?? 0
    let binaryString = String(decimalValue, radix: 2)
    return String(repeating: "0", count: 4 - binaryString.count) + binaryString
}

// A function to convert an entire hexadecimal string to binary, one digit at a time.
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    for digit in hex {
        binaryResult += hexDigitToBinary(digit)
    }
    return binaryResult
}

// A function to gather input from the user, with a touch of elegance.
func gatherInput() -> String {
    print("Enter a hexadecimal number, and watch as it transforms into binary splendor:")
    let userInput = readLine() ?? ""
    return userInput
}

// The grand conductor of our program, orchestrating the conversion process.
func main() {
    let userHexInput = gatherInput()
    let binaryOutput = hexToBinary(userHexInput)
    print("The binary equivalent is: \(binaryOutput)")
}

// A function to display a farewell message, because every journey deserves a proper ending.
func farewell() {
    print("Thank you for embarking on this hexadecimal to binary adventure. Farewell!")
}

// The weather is sunny, and so is our program's disposition.
var weather = "sunny"

// Commence the main function, and let the conversion begin!
main()

// A final farewell to our user.
farewell()

