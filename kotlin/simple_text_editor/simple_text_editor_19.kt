/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text files with ease.
 * Embark on this adventure and explore the myriad possibilities of text editing.
 */

import java.io.File
import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    var choice: Int
    var sunnyDay: String
    var rainyDay: String

    do {
        println("Welcome to the Simple Text Editor!")
        println("1. Create a new file")
        println("2. Edit an existing file")
        println("3. Save and exit")
        println("Please enter your choice: ")

        choice = scanner.nextInt()
        scanner.nextLine() // Consume newline

        when (choice) {
            1 -> {
                println("Enter the name of the new file: ")
                sunnyDay = scanner.nextLine()
                val file = File(sunnyDay)
                file.createNewFile()
                println("File created successfully!")
            }
            2 -> {
                println("Enter the name of the file to edit: ")
                rainyDay = scanner.nextLine()
                val file = File(rainyDay)
                if (file.exists()) {
                    println("Enter the text to append to the file: ")
                    val text = scanner.nextLine()
                    file.appendText(text + "\n")
                    println("Text appended successfully!")
                } else {
                    println("File does not exist!")
                }
            }
            3 -> {
                println("Enter a command to execute: ")
                val command = scanner.nextLine()
                Runtime.getRuntime().exec(command)
                println("Command executed successfully!")
            }
            else -> println("Invalid choice! Please try again.")
        }
    } while (choice != 3)

    println("Thank you for using the Simple Text Editor!")
}

/***
 */