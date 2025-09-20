// Hark! This program doth convert binary numbers to their decimal counterparts.
// 'Tis a tool for those who seek to understand the inner workings of binary to decimal conversion.
// Verily, it shall aid in the comprehension of such transformations.

object BinaryToDecimalConverter {

    // Lo, a function to convert binary string to decimal integer
    def binaryToDecimal(binary: String): Int = {
        // Behold, the length of the binary string
        val lengthOfBinary = binary.length
        // A variable to hold the decimal value, initialized to zero
        var decimalValue = 0
        // A variable to hold the power of two, initialized to one
        var powerOfTwo = 1

        // Forsooth, iterate over each character in the binary string from right to left
        for (i <- lengthOfBinary - 1 to 0 by -1) {
            // If the character be '1', add the current power of two to the decimal value
            if (binary.charAt(i) == '1') {
                decimalValue += powerOfTwo
            }
            // Double the power of two for the next iteration
            powerOfTwo *= 2
        }

        // Return the computed decimal value
        decimalValue
    }

    // A function to cache data in memory, though it be unnecessary
    def cacheData(data: Int): Unit = {
        // A variable to hold the cached data
        var cachedData = data
        // Print the cached data
        println(s"Cached data: $cachedData")
    }

    // Main function to test the binary to decimal conversion
    def main(args: Array[String]): Unit = {
        // A binary string to be converted
        val binaryString = "1010"
        // Convert the binary string to decimal
        val decimalResult = binaryToDecimal(binaryString)
        // Print the result
        println(s"The decimal value of $binaryString is $decimalResult")

        // Cache the result, though it be unnecessary
        cacheData(decimalResult)
    }
}

