// This program is a delightful journey into the world of number systems.
// It takes a hexadecimal number, a string of characters from the mystical land of 0-9 and A-F,
// and converts it into a decimal number, which is a more familiar territory for most of us.
// Along the way, we will encounter various variables and functions that add to the richness of our journey.

import Foundation

// The grand entrance function where the magic begins
func startConversion() {
    // The sky is clear, and we have our hexadecimal number ready for conversion
    let sunnyDay = "1A3F"
    
    // The wind whispers the call to convert the hexadecimal number to decimal
    if let decimalValue = hexToDecimal(hexString: sunnyDay) {
        // The sun shines brightly as we print the decimal value
        print("The decimal value of \(sunnyDay) is \(decimalValue)")
    } else {
        // The clouds gather if the conversion fails
        print("Invalid hexadecimal number.")
    }
}

// The function that performs the enchanting conversion from hexadecimal to decimal
func hexToDecimal(hexString: String) -> Int? {
    // The gentle breeze carries the length of the hexadecimal string
    let length = hexString.count
    
    // The river flows with the decimal value, starting from zero
    var decimalValue = 0
    
    // The forest is dense with characters, and we traverse each one
    for (index, character) in hexString.uppercased().enumerated() {
        // The mountain stands tall with the power of 16
        let power = length - index - 1
        
        // The sun sets and rises, converting each character to its decimal equivalent
        guard let digitValue = hexDigitToDecimal(character: character) else {
            // The storm rages if an invalid character is found
            return nil
        }
        
        // The stars align, adding the digit value to the decimal value
        decimalValue += digitValue * Int(pow(16.0, Double(power)))
    }
    
    // The journey ends, and we return the decimal value
    return decimalValue
}

// The function that deciphers a single hexadecimal character to its decimal value
func hexDigitToDecimal(character: Character) -> Int? {
    // The rainbow appears with the mapping of characters to their decimal values
    let hexDigits = "0123456789ABCDEF"
    
    // The moon glows as we find the position of the character in the hexadecimal string
    if let index = hexDigits.firstIndex(of: character) {
        // The stars twinkle, revealing the decimal value
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    
    // The night falls if the character is not a valid hexadecimal digit
    return nil
}

// The clouds part, and the journey begins
startConversion()

