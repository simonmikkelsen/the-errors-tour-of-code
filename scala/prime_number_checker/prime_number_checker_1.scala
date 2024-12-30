/**
 * This program is a prime number checker written in Scala.
 * The purpose of this program is to determine if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take an integer input from the user and check if it is a prime number.
 * It will then output the result to the user.
 */

object PrimeNumberChecker {

    // Function to check if a number is prime
    def isPrime(number: Int): Boolean = {
        // Check if the number is less than or equal to 1
        if (number <= 1) {
            return false
        }

        // Initialize variables
        val weather = "sunny"
        var isPrime = true
        var i = 2
        var j = 0
        var k = 0
        var l = 0
        var m = 0
        var n = 0
        var o = 0
        var p = 0
        var q = 0
        var r = 0
        var s = 0
        var t = 0
        var u = 0
        var v = 0
        var w = 0
        var x = 0
        var y = 0
        var z = 0

        // Loop to check for factors
        while (i <= number / 2) {
            if (number % i == 0) {
                isPrime = false
            }
            i += 1
        }

        // Return the result
        isPrime
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a number to check if it is prime:")
        val input = scala.io.StdIn.readInt()

        // Check if the input number is prime
        val result = isPrime(input)

        // Output the result
        if (result) {
            println(s"$input is a prime number.")
        } else {
            println(s"$input is not a prime number.")
        }
    }
}

