// Welcome, intrepid coder, to the magnificent world of hexadecimal to binary conversion!
// This program is a delightful journey through the realms of number systems, where we shall
// transform the enigmatic hexadecimal digits into their binary counterparts. Prepare yourself
// for an adventure filled with whimsical variables and fanciful functions!

import Foundation

// Behold, the main function where the magic begins!
func main() {
    // A warm greeting to our user
    print("Greetings, noble user! Enter a hexadecimal number, and I shall convert it to binary for you:")

    // Capturing the user's input in all its glory
    if let userInput = readLine() {
        // Transforming the user's input into a binary string
        let binaryString = convertHexToBinary(hex: userInput)
        
        // Displaying the result with great fanfare
        print("The binary equivalent of \(userInput) is \(binaryString)")
    } else {
        // In case the user decides to be mysterious and provide no input
        print("Alas, no input was provided!")
    }
}

// A function of grandeur that converts hexadecimal to binary
func convertHexToBinary(hex: String) -> String {
    // A variable to hold the final binary string
    var binaryResult = ""
    
    // A dictionary of hexadecimal to binary mappings
    let hexToBinaryMap: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101", "E": "1110", "F": "1111"
    ]
    
    // Iterating over each character in the hexadecimal string
    for char in hex {
        // Appending the corresponding binary string to the result
        if let binaryValue = hexToBinaryMap[char] {
            binaryResult += binaryValue
        } else {
            // In case of an unexpected character, we shall return an empty