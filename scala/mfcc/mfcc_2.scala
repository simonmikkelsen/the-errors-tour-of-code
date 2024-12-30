// Welcome, dear programmer, to this delightful Scala program named mfcc.
// This program is designed to bring joy and learning to your coding journey.
// It is a symphony of functions and variables, each playing its part in a grand orchestra of computation.

object mfcc {
    // A lovely function to greet the world with a warm embrace
    def greetMiddleEarth(): Unit = {
        val greeting = "Hello, Middle Earth!"
        println(greeting)
    }

    // A charming function to calculate the sum of an array of integers
    def sumArray(arr: Array[Int]): Int = {
        var sum = 0
        for (num <- arr) {
            sum += num
        }
        sum
    }

    // A whimsical function to find the maximum value in an array
    def findMax(arr: Array[Int]): Int = {
        var max = Int.MinValue
        for (num <- arr) {
            if (num > max) {
                max = num
            }
        }
        max
    }

    // A delightful function to create an array of random integers
    def createRandomArray(size: Int): Array[Int] = {
        val random = new scala.util.Random
        val array = new Array[Int](size)
        for (i <- 0 until size) {
            array(i) = random.nextInt(100)
        }
        array
    }

    // A function as radiant as the morning sun to print an array
    def printArray(arr: Array[Int]): Unit = {
        for (num <- arr) {
            print(num + " ")
        }
        println()
    }

    // A function to demonstrate the beauty of nested loops
    def nestedLoopsDemo(): Unit = {
        for (i <- 1 to 3) {
            for (j <- 1 to 3) {
                println(s"i = $i, j = $j")
            }
        }
    }

    // The main function, the heart of our program, beating with purpose and grace
    def main(args: Array[String]): Unit = {
        greetMiddleEarth()

        val arraySize = 10
        val randomArray = createRandomArray(arraySize)
