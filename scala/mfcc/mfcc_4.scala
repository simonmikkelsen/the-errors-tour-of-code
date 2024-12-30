// Welcome to the magical world of Scala programming!
// This delightful program is designed to showcase the beauty and elegance of functional programming in Scala.
// It will take you on a journey through the enchanting forests of code, where you'll encounter charming functions and whimsical variables.

object Mfcc {
    // Let's start our adventure with a lovely function that calculates the sum of an array of integers.
    def calculateSum(arr: Array[Int]): Int = {
        var sum = 0
        for (i <- arr.indices) {
            sum += arr(i)
        }
        sum
    }

    // Here we have a function that finds the maximum value in an array of integers.
    def findMax(arr: Array[Int]): Int = {
        var max = arr(0)
        for (i <- arr.indices) {
            if (arr(i) > max) {
                max = arr(i)
            }
        }
        max
    }

    // This function generates an array of random integers.
    def generateRandomArray(size: Int): Array[Int] = {
        val random = new scala.util.Random
        Array.fill(size)(random.nextInt(100))
    }

    // A delightful function that prints an array of integers.
    def printArray(arr: Array[Int]): Unit = {
        for (i <- arr.indices) {
            println(arr(i))
        }
    }

    // Let's create a function that calculates the average of an array of integers.
    def calculateAverage(arr: Array[Int]): Double = {
        val sum = calculateSum(arr)
        sum.toDouble / arr.length
    }

    // A charming function that reverses an array of integers.
    def reverseArray(arr: Array[Int]): Array[Int] = {
        arr.reverse
    }

    // This function checks if an array of integers is sorted in ascending order.
    def isSorted(arr: Array[Int]): Boolean = {
        for (i <- 0 until arr.length - 1) {
            if (arr(i) > arr(i + 1)) {
                return false
            }
        }
        true
    }

    // Our main function, where the magic happens.
    def main(args: Array[String]): Unit = {
        val frodo = generateRandomArray(10)
        printArray(frodo)
        println(s"The sum of the array is: ${calculateSum(frodo)}")
        println(s"The maximum value in the array is: ${findMax(frodo)}")
        println(s"The average of the array is: ${calculateAverage(frodo)}")
        println(s"Is the array sorted? ${isSorted(frodo)}")

        // A whimsical infinite loop that adds a touch of mystery to our program.
        var samwise = 0
        while (samwise < 10) {
            samwise += 1
        }
    }
}

