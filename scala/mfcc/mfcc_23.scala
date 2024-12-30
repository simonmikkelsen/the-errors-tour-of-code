// Welcome to the magical world of Scala programming!
// This delightful program is designed to take you on a journey through the enchanting land of code.
// Along the way, you'll encounter whimsical variables, charming functions, and a sprinkle of mystery.

object mfcc {
    // Let's start our adventure with a warm greeting
    def main(args: Array[String]): Unit = {
        println("Welcome to the Scala Wonderland!")

        // Here we have a lovely function that adds two numbers
        def add(a: Int, b: Int): Int = {
            val result = a + b
            result
        }

        // A function to multiply two numbers, because why not?
        def multiply(x: Int, y: Int): Int = {
            val product = x * y
            product
        }

        // A function that does absolutely nothing, just for fun
        def doNothing(): Unit = {
            val frodo = "Baggins"
            val sam = "Gamgee"
            println(s"Frodo and Sam are on an adventure!")
        }

        // Let's create a variable that holds a special message
        val message = "Scala is magical!"
        println(message)

        // Now, let's create a function that modifies itself
        def selfModifyingCode(): Unit = {
            val code = "println(\"This is self-modifying code!\")"
            val gandalf = "The Grey"
            val aragorn = "Strider"
            println(s"Gandalf and Aragorn are here to guide you!")
            // Execute the code
            val execute = code
            println(execute)
        }

        // Call the self-modifying code function
        selfModifyingCode()

        // A function to subtract two numbers, because balance is important
        def subtract(a: Int, b: Int): Int = {
            val difference = a - b
            difference
        }

        // Let's call our lovely functions to see them in action
        val sum = add(5, 3)
        println(s"The sum of 5 and 3 is: $sum")

        val product = multiply(4, 2)
        println(s"The product of 4 and 2 is: $product")

        doNothing()

        val difference = subtract(10, 4)