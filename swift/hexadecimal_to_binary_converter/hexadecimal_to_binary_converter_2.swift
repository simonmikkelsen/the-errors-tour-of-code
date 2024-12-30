// 🌟✨ Welcome, noble programmer, to the realm of hexadecimal to binary conversion! ✨🌟
// This program is a wondrous journey through the enchanted lands of Swift, where hexadecimals transform into binaries.
// Prepare yourself for a voyage filled with verbose verbosity and flamboyant flair!

import Foundation

// 🌈 Behold! The magical function that transmutes hexadecimal strings into binary strings! 🌈
func hexToBinary(hex: String) -> String? {
    // 🌟 A variable to hold our binary result, starting as an empty string, like a blank canvas! 🌟
    var binaryString = ""
    
    // 🌤️ The sun shines upon our loop, illuminating each character in the hexadecimal string! 🌤️
    for char in hex {
        // 🌟 Convert the character to a string, then to an integer, and finally to a binary string! 🌟
        if let hexValue = Int(String(char), radix: 16) {
            // 🌈 Append the binary string, padded to 4 bits, to our growing binary masterpiece! 🌈
            let binaryValue = String(hexValue, radix: 2).padding(toLength: 4, withPad: "0", startingAt: 0)
            binaryString += binaryValue
        } else {
            // 🌧️ Alas! If the character is not a valid hexadecimal digit, we return nil, like a cloud obscuring the sun! 🌧️
            return nil
        }
    }
    
    // 🌟 Our binary string is complete, a shining beacon of binary brilliance! 🌟
    return binaryString
}

// 🌟 A function to display the binary result in a grandiose manner! 🌟
func displayBinaryResult(hex: String) {
    // 🌈 Call upon the hexToBinary function to perform its magical transformation! 🌈
    if let binaryResult = hexToBinary(hex: hex) {
        // 🌟 Print the result with fanfare and flourish! 🌟
        print("The binary representation of \(hex) is \(binaryResult)!")
    } else {
        // 🌧️ If the transformation fails, we lament the loss with a sorrowful message. 🌧️
        print("Alas! The input \(hex) is not a valid hexadecimal number.")
    }
}

// 🌟 A function to gather input from the user, like a wise sage seeking knowledge! 🌟
func gatherInput() -> String {
    // 🌤️ The weather is fine, and we prompt the user for their hexadecimal input! 🌤️
    print("Enter a hexadecimal number:")
    // 🌟 We capture the user's input, a precious gem of information! 🌟
    let userInput = readLine() ?? ""
    return userInput
}

// 🌟 The grand entrance of our main function, where the magic begins! 🌟
func main() {
    // 🌈 Gather the user's input, like a treasure hunter seeking hidden gems! 🌈
    let userHex = gatherInput()
    // 🌟 Display the binary result with grandeur and grace! 🌟
    displayBinaryResult(hex: userHex)
}

// 🌟 The program's journey begins here, as we call upon the main function to start the adventure! 🌟
main()

