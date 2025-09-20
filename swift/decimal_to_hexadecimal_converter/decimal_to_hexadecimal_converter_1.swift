// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system used in mathematics and computing.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written in a verbose manner to help programmers understand each step in detail.

import Foundation

// Function to convert a single digit to its hexadecimal character
func digitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var remainder = 0
    var quotient = 0
    var temp = 0
    var sunny = 0
    var rainy = 0
    var cloudy = 0
    var windy = 0
    var stormy = 0
    var foggy = 0
    var snowy = 0
    var hail = 0
    var thunder = 0
    var lightning = 0
    
    // Loop to convert each digit
    while number > 0 {
        remainder = number % 16
        quotient = number / 16
        temp = remainder
        sunny = quotient
        rainy = temp
        cloudy = sunny
        windy = rainy
        stormy = cloudy
        foggy = windy
        snowy = stormy
        hail = foggy