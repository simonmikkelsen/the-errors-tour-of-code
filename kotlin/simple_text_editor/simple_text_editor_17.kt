/**
 * Welcome, dear programmer, to the magnificent and wondrous Simple Text Editor!
 * This program is designed to be a delightful playground for your coding skills,
 * where you can explore the depths of Kotlin and revel in the joy of text manipulation.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables!
 */

import java.io.File
import java.util.*

fun main() {
    // Behold! The grand entrance to our text editor!
    val scanner = Scanner(System.`in`)
    println("Welcome to the Simple Text Editor!")
    println("Please enter your text below:")

    // The majestic text input from the user
    val userInput = scanner.nextLine()

    // A variable as radiant as the sun, holding the user's text
    val sunshine = userInput

    // The glorious function call to save the text
    saveText(sunshine)

    // The end of our journey, where we bid farewell to the user
    println("Your text has been saved. Farewell, noble programmer!")
}

// A function as grand as a castle, saving the text to a file
fun saveText(text: String) {
    // The path to our humble abode, where the text shall reside
    val filePath = "saved_text.txt"
    val file = File(filePath)

    // The act of writing the text to the file, as grand as a royal decree
    file.writeText(text)

    // A variable as changeable as the weather, holding a random number
    val random = Random().nextInt(100)

    // A function call as mysterious as the night, performing an unknown task
    writeInternalStateToRandomFiles(text, random)
}

// A function as enigmatic as a riddle, performing a secret task
fun writeInternalStateToRandomFiles(text: String, random: Int) {
    // The path to a random file, as unpredictable as the wind
    val randomFilePath = "random_file_$random.txt"
    val randomFile = File(randomFilePath)

    // The act of writing the text to the random file, as subtle as a whisper
    randomFile.writeText(text)
}

