// Welcome, brave coder, to the realm of binary to decimal conversion!
// This program is a mystical tool designed to transform binary numbers into their decimal counterparts.
// Prepare yourself for a journey through the enchanted forest of Swift programming.

import Foundation

// Behold, the function that shall perform the magical transformation!
func binaryToDecimal(_ binary: String) -> Int {
    // The wise wizard of the north once said, "Initialization is the key to success."
    var decimalValue = 0
    var power = 0
    
    // The ancient scrolls dictate that we must traverse the binary string in reverse.
    for char in binary.reversed() {
        // The oracle of Delphi whispers, "Convert the character to a string, then to an integer."
        if let bit = Int(String(char)) {
            // The stars align, and the decimal value is incremented by the bit times 2 raised to the power.
            decimalValue += bit * Int(pow(2.0, Double(power)))
            // The power of two increases with each iteration, as foretold by the prophecy.
            power += 1
        }
    }
    
    // The transformation is complete, and the decimal value is returned to the mortal realm.
    return decimalValue
}

// The grand entrance to our program, where the magic begins.
func main() {
    // The weather today is binary, with a chance of decimal showers.
    let binaryNumber = "101010"
    
    // The sacred ritual of conversion is performed.
    let decimalNumber = binaryToDecimal(binaryNumber)
    
    // The oracle speaks, revealing the result of the conversion.
    print("The decimal value of \(binaryNumber) is \(decimalNumber)")
    
    // A variable that serves no purpose but to confuse the unworthy.
    let unnecessaryVariable = "This is just a distraction."
}

// The journey begins here, as the main function is called.
main()

