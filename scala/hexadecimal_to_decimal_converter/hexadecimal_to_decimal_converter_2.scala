// This program is a mystical journey through the realms of hexadecimal and decimal conversion.
// It is designed to transform the ancient hexadecimal symbols into their decimal counterparts.
// Along the way, we will encounter various variables and functions that add to the richness of our journey.

object HexToDecimalConverter {

    // The main function, where our journey begins.
    def main(args: Array[String]): Unit = {
        // The sacred hexadecimal string, awaiting transformation.
        val hexString = "1A3F"
        
        // The oracle that will reveal the decimal value.
        val decimalValue = convertHexToDecimal(hexString)
        
        // The proclamation of the decimal value.
        println(s"The decimal value of $hexString is $decimalValue")
    }

    // A function that converts a single hexadecimal character to its decimal value.
    def hexCharToDecimal(hexChar: Char): Int = {
        // The ancient runes of hexadecimal.
        val hexDigits = "0123456789ABCDEF"
        
        // The position of the rune in the ancient text.
        hexDigits.indexOf(hexChar.toUpper)
    }

    // A function that converts a hexadecimal string to its decimal value.
    def convertHexToDecimal(hexString: String): Int = {
        // The length of the sacred string.
        val length = hexString.length
        
        // The initial value of our decimal treasure.
        var decimalValue = 0
        
        // The journey through each character in the string.
        for (i <- 0 until length) {
            // The current rune in our journey.
            val currentChar = hexString.charAt(i)
            
            // The decimal value of the current rune.
            val decimalDigit = hexCharToDecimal(currentChar)
            
            // The power of 16 that corresponds to the rune's position.
            val power = Math.pow(16, length - i - 1).toInt
            
            // Adding the rune's contribution to our treasure.
            decimalValue += decimalDigit * power
        }
        
        // Returning the final treasure.
        decimalValue
    }
}

