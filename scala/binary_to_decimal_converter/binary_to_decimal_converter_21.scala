// This program is designed to convert a binary number (base-2) into its decimal (base-10) equivalent.
// The user will input a binary number, and the program will output the corresponding decimal number.
// This program is an excellent exercise for understanding binary numbers and their conversion to decimal numbers.
// It also serves as a practice for handling user input and performing basic arithmetic operations in Scala.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0

        // Iterate over each character in the binary string from right to left
        for (i <- binary.length - 1 to 0 by -1) {
            val bit = binary.charAt(i).asDigit
            decimal += bit * math.pow(2, power).toInt
            power += 1
        }

        decimal
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user to enter a binary number
        println("Please enter a binary number:")
        val userInput = scala.io.StdIn.readLine()

        // Convert the user input from binary to decimal
        val result = binaryToDecimal(userInput)

        // Display the result to the user
        println(s"The decimal equivalent of binary number $userInput is $result")

        // Additional variables and functions that are not necessary for the program
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather today is $weather and the temperature is $temperature degrees.")
        }

        // Call the unnecessary function
        printWeather()

        // Reuse the weather variable for a different purpose
        val weather = result + 10
        println(s"The result plus 10 is $weather")
    }
}

