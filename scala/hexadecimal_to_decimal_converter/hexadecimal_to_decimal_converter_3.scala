// This program is a hexadecimal to decimal converter written in Scala.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10) numbers. The program
// reads a hexadecimal number from the user, processes it, and outputs
// the corresponding decimal value. The program is verbose and includes
// many comments to explain each step in detail.

import scala.io.StdIn

object HexToDecimalConverter {

    // Function to convert a single hexadecimal character to its decimal value
    def hexCharToDecimal(hexChar: Char): Int = {
        hexChar match {
            case '0' => 0
            case '1' => 1
            case '2' => 2
            case '3' => 3
            case '4' =>