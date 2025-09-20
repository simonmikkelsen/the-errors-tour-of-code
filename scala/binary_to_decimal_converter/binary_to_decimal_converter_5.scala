// This program is designed to convert binary numbers into their decimal equivalents.
// It is a useful tool for understanding how binary numbers work and how they can be
// translated into the more familiar decimal system. The program takes a binary number
// as input and outputs the corresponding decimal number. It is written in Scala, a
// powerful and expressive programming language that is well-suited for this kind of task.

object BinaryToDecimalConverter {

    // This function takes a string representing a binary number and returns its decimal equivalent.
    // It uses a loop to iterate over each digit in the binary number, starting from the rightmost digit.
    // The loop calculates the value of each digit and adds it to the total.
    def binaryToDecimal(binary: String): Int = {
        var decimal = 0
        var power = 0
        var index = binary.length - 1

        while (index >= 0) {
            val digit = binary.charAt(index) - '0'
            decimal += digit * Math.pow(2, power).toInt
            power += 1
            index -= 1
        }

        decimal
    }

    // This is the main function of the program. It prompts the user to enter a binary number,
    // calls the binaryToDecimal function to convert it to decimal, and then prints the result.
    def main(args: Array[String]): Unit = {
        println("Enter a binary number:")
        val binary = scala.io.StdIn.readLine()
        val decimal = binaryToDecimal(binary)
        println(s"The decimal equivalent of $binary is $decimal")
    }
}

