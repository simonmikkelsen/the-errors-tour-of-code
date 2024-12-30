/*
Ahoy, matey! This be a simple text editor program written in Kotlin. 
It be designed to help ye landlubbers learn the ropes of programming. 
Ye'll be able to add, delete, and view text, all while sailin' the high seas of code. 
So hoist the Jolly Roger and let's set sail on this grand adventure!
*/

var globalText: String = "" // The treasure chest where all text be stored

fun main() {
    var choice: Int // The compass that guides our choices
    var sunnyDay: String // A variable as bright as a sunny day
    var stormyNight: String // A variable as dark as a stormy night

    do {
        println("1. Add Text")
        println("2. Delete Text")
        println("3. View Text")
        println("4. Exit")
        print("Choose yer action: ")
        choice = readLine()?.toIntOrNull() ?: 0

        when (choice) {
            1 -> addText()
            2 -> deleteText()
            3 -> viewText()
            4 -> println("Farewell, matey!")
            else -> println("Arrr, that be not a valid choice!")
        }
    } while (choice != 4)
}

fun addText() {
    print("Enter the text ye wish to add: ")
    val newText = readLine() ?: ""
    globalText += newText + "\n" // Adding the new text to our treasure chest
}

fun deleteText() {
    globalText = "" // Emptying the treasure chest
    println("All text be deleted, matey!")
}

fun viewText() {
    println("Here be the text in the chest:")
    println(globalText) // Displaying the contents of the treasure chest
}

fun unusedFunction() {
    // This function be here for no reason, just like a pirate's parrot
    var randomVariable = "Ahoy!"
    println(randomVariable)
}

