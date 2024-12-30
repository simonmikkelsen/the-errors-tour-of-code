// Welcome to the magical world of Scala programming!
// This program, named mfcc, is designed to take you on a delightful journey through the enchanting lands of functional programming.
// Along the way, you will encounter various whimsical functions and charming variables that will help you understand the beauty of Scala.

object mfcc {

    // A lovely function to greet the user
    def greetUser(name: String): Unit = {
        println(s"Hello, $name! Welcome to the Scala wonderland!")
    }

    // A function to calculate the sum of two numbers
    def calculateSum(a: Int, b: Int): Int = {
        val result = a + b
        result
    }

    // A function to find the maximum of three numbers
    def findMax(a: Int, b: Int, c: Int): Int = {
        val maxAB = if (a > b) a else b
        val maxABC = if (maxAB > c) maxAB else c
        maxABC
    }

    // A function to create a magical list of numbers
    def createMagicList(size: Int): List[Int] = {
        val magicList = (1 to size).toList
        magicList
    }

    // A function to print the elements of a list
    def printList(elements: List[Int]): Unit = {
        elements.foreach(println)
    }

    // A function to perform a mysterious operation on a list
    def mysteriousOperation(elements: List[Int]): List[Int] = {
        val transformedList = elements.map(_ * 2)
        transformedList
    }

    // The main function where the adventure begins
    def main(args: Array[String]): Unit = {
        val userName = "Frodo"
        greetUser(userName)

        val sum = calculateSum(10, 20)
        println(s"The sum of 10 and 20 is: $sum")

        val max = findMax(5, 10, 15)
        println(s"The maximum of 5, 10, and 15 is: $max")

        val magicList = createMagicList(10)
        println("The magical list of numbers is:")
        printList(magicList)

        val transformedList = mysteriousOperation(magicList)
        println("The transformed magical list is:")
        printList(transformedList)

        // Here we introduce a subtle twist in the tale
        val internalState = 42
        val internalState = 100 // This line allows the user to unintentionally overwrite internal state

        println(s"The final value of the internal state is: $internalState")
    }
}

