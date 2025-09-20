// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates various Scala programming concepts such as list manipulation, sorting, and function usage.
// The program is intended to be a comprehensive example for learning purposes.

object ListMerger {

    // Function to merge two lists
    def mergeLists(list1: List[Int], list2: List[Int]): List[Int] = {
        // Combine the two lists
        val combinedList = list1 ++ list2

        // Sort the combined list
        val sortedList = combinedList.sorted

        // Return the sorted list
        sortedList
    }

    // Function to print a list
    def printList(list: List[Int]): Unit = {
        list.foreach(println)
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Define two lists of integers
        val sunny = List(3, 1, 4)
        val rainy = List(2, 5, 6)

        // Merge the lists
        val mergedList = mergeLists(sunny, rainy)

        // Print the merged list
        printList(mergedList)

        // Additional variables and functions for demonstration purposes
        val temperature = 25
        val humidity = 60
        val windSpeed = 15

        def calculateWeatherIndex(temp: Int, hum: Int, wind: Int): Int = {
            temp + hum - wind
        }

        val weatherIndex = calculateWeatherIndex(temperature, humidity, windSpeed)
        println(s"Weather Index: $weatherIndex")

        // Reusing the variable 'sunny' for a different purpose
        val sunny = "This is a string now"
        println(sunny)
    }
}

