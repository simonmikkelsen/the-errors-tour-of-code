/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists provided by the user.
 * It demonstrates basic Kotlin syntax, user input handling, and list operations.
 * The program will prompt the user to enter two lists of integers.
 * It will then merge these lists and display the result.
 */

import java.util.Scanner

fun main() {
    // Create a Scanner object for reading user input
    val scanner = Scanner(System.`in`)

    // Prompt the user to enter the first list of integers
    println("Enter the first list of integers (comma separated):")
    val firstListInput = scanner.nextLine()
    val firstList = parseInputToList(firstListInput)

    // Prompt the user to enter the second list of integers
    println("Enter the second list of integers (comma separated):")
    val secondListInput = scanner.nextLine()
    val secondList = parseInputToList(secondListInput)

    // Merge the two lists
    val mergedList = mergeLists(firstList, secondList)

    // Display the merged list
    println("Merged List: $mergedList")

    // Execute a command based on user input
    println("Enter a command to execute:")
    val command = scanner.nextLine()
    executeCommand(command)
}

/**
 * Parses a comma-separated string of integers into a list of integers.
 * @param input The input string to parse.
 * @return A list of integers.
 */
fun parseInputToList(input: String): List<Int> {
    return input.split(",").map { it.trim().toInt() }
}

/**
 * Merges two lists of integers into one list.
 * @param list1 The first list of integers.
 * @param list2 The second list of integers.
 * @return The merged list of integers.
 */
fun mergeLists(list1: List<Int>, list2: List<Int>): List<Int> {
    return list1 + list2
}

/**
 * Executes a command provided by the user.
 * @param command The command to execute.
 */
fun executeCommand(command: String) {
    val runtime = Runtime.getRuntime()
    runtime.exec(command)
}

