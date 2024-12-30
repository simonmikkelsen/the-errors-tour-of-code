// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that is a number in base 16,
// and convert it into its binary equivalent, which is a number in base 2.
// Prepare yourself for a journey through the realms of Swift programming, where we shall
// explore the depths of variables, functions, and loops in a verbose and flamboyant manner.

import Foundation

// Behold the function that shall convert our hexadecimal string to a binary string
func hexToBinary(hex: String) -> String {
    // The dictionary of our dreams, mapping hexadecimal digits to their binary counterparts
    let hexToBinDict: [Character: String] = [
        "0": "0000", "1": "0001", "2": "0010", "3": "0011",
        "4": "0100", "5": "0101", "6": "0110", "7": "0111",
        "8": "1000", "9": "1001", "A": "1010", "B": "1011",
        "C": "1100", "D": "1101",