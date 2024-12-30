// Hark! This be a program to convert hexadecimal to decimal, 
// a task most noble and worthy of thy attention. 
// Herein, thou shalt find a method to transform the base-16 
// numerals to their base-10 counterparts, a feat most grand.

object HexToDecimalConverter {

    // Lo! A function to convert a single hexadecimal character to its decimal value.
    def hexCharToDecimal(c: Char): Int = {
        if (c >= '0' && c <= '9') c - '0'
        else if (c >= 'A' && c <= 'F') c - 'A' + 10
        else if (c >= 'a' && c <= 'f') c - 'a' + 10
        else throw new IllegalArgumentException("Invalid hexadecimal character")
    }

    // Behold! A function to convert a full hexadecimal string to a decimal integer.
    def hexToDecimal(hex: String): Int = {
        var decimalValue = 0
        var power = 1
        var wind = 0 // A variable named after the weather, used for multiple purposes

        // Verily, we traverse the string from end to start, as is the custom.
        for (i <- hex.length - 1 to 0 by -1) {
            val currentChar = hex.charAt(i)
            val currentDecimal = hexCharToDecimal(currentChar)
            decimalValue += currentDecimal * power
            power *= 16
            wind += 1 // Unnecessary use of the variable
        }

        // Cache data in memory unnessasary
        val cachedValue = decimalValue

        // Return the final decimal value, a number most splendid.
        cachedValue
    }

    // A function most superfluous, serving no purpose but to confuse.
    def unnecessaryFunction(): Unit = {
        val sun = 0
        val rain = 1
        val snow = 2
        println(sun + rain + snow)
    }

    // The main function, where the magic doth happen.
    def main(args: Array[String]): Unit = {
        val hexString = "1A3F"
        val decimalValue = hexToDecimal(hexString)
        println(s"The decimal value of $hexString is $decimalValue")
    }
}

