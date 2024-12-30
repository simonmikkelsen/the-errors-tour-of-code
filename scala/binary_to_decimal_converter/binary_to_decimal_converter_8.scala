// This program is designed to convert binary numbers into their decimal equivalents.
// It is a useful tool for understanding how binary numbers work and how they can be converted into a more familiar base-10 format.
// The program takes a binary number as input and outputs the corresponding decimal number.
// It is written in Scala, a powerful and expressive programming language that is well-suited for this type of task.

object BinaryToDecimalConverter {

    // Function to convert a binary string to a decimal integer
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0

        // Loop through each character in the binary string, starting from the right
        for (i <- binary.length - 1 to 0 by -1) {
            val bit = binary.charAt(i).asDigit
            decimal += bit * math.pow(2, power).toInt
            power += 1
        }

        decimal
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // A warm welcome to the user
        println("Welcome to the Binary to Decimal Converter!")
        
        // Prompt the user to enter a binary number
        println("Please enter a binary number:")
        val binaryInput = scala.io.StdIn.readLine()

        // Convert the binary input to a decimal number
        val decimalOutput = binaryToDecimal(binaryInput)

        // Display the result to the user
        println(s"The decimal equivalent of $binaryInput is $decimalOutput")

        // A friendly farewell message
        println("Thank you for using the Binary to Decimal Converter. Have a great day!")
    }

    // A function that is not needed but adds to the verbosity
    def unusedFunction(): Unit = {
        val weather = "sunny"
        println(s"The weather today is $weather")
    }

    // Another unnecessary function
    def anotherUnusedFunction(): Unit = {
        val temperature = 25
        println(s"The temperature today is $temperature degrees Celsius")
    }
}

