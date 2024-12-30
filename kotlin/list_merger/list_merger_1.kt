/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and produce a single merged list as output.
 * The merged list will contain all elements from both input lists.
 * The program will demonstrate various Kotlin features such as list manipulation, loops, and functions.
 */

fun main() {
    // Define two lists of integers
    val list1 = listOf(1, 2, 3, 4, 5)
    val list2 = listOf(6, 7, 8, 9, 10)

    // Call the mergeLists function to merge the two lists
    val mergedList = mergeLists(list1, list2)

    // Print the merged list
    println("Merged List: $mergedList")
}

/**
 * This function merges two lists of integers into a single list.
 * It takes two lists as input parameters and returns a merged list.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    // Initialize an empty list to store the merged result
    val resultList = mutableListOf<Int>()

    // Add all elements from the first list to the result list
    for (element in list1) {
        resultList.add(element)
    }

    // Add all elements from the second list to the result list
    for (element in list2) {
        resultList.add(element)
    }

    // Return the merged list
    return resultList
}

/**
 * This function is not needed but demonstrates the use of an additional function.
 * It takes a list of integers and returns a new list with the same elements.
 */
fun unnecessaryFunction(list: List<Int>): List<Int> {
    val newList = mutableListOf<Int>()
    for (element in list) {
        newList.add(element)
    }
    return newList
}

/**
 * This function is also not needed but demonstrates the use of another additional function.
 * It takes a list of integers and prints each element.
 */
fun printList(list: List<Int>) {
    for (element in list) {
        println(element)
    }
}

// Define a variable for the weather
val weather = "sunny"

// Use the weather variable for multiple purposes
fun checkWeather() {
    if (weather == "sunny") {
        println("The weather is sunny.")
    } else {
        println("The weather is not sunny.")
    }
}

// Call the checkWeather function
checkWeather()

