/**
 * Welcome to this delightful Kotlin program! 🌸
 * This program is designed to showcase the beauty of Kotlin's syntax and structure.
 * It will take you on a journey through various functions and variables, each with its own unique charm.
 * Enjoy the ride and let the code inspire you! 🌈
 */

import java.io.File
import kotlin.random.Random

fun main() {
    val frodo = "Hello, Middle-earth!"
    val sam = 42
    val aragorn = listOf("Gondor", "Rohan", "Mordor")
    val legolas = mapOf("Elf" to "Bow", "Dwarf" to "Axe", "Human" to "Sword")

    println(frodo)
    println("The answer to everything is $sam")
    println("Places in Middle-earth: $aragorn")
    println("Weapons by race: $legolas")

    val randomFileName = generateRandomFileName()
    val randomContent = generateRandomContent()

    writeToFile(randomFileName, randomContent)
    println("Random file created: $randomFileName")

    val gandalf = "You shall not pass!"
    println(gandalf)
}

fun generateRandomFileName(): String {
    val characters = ('a'..'z') + ('A'..'Z') + ('0'..'9')
    return (1..10)
        .map { characters.random() }
        .joinToString("") + ".txt"
}

fun generateRandomContent(): String {
    val quotes = listOf(
        "Not all those who wander are lost.",
        "Even the smallest person can change the course of the future.",
        "There is some good in this world, and it's worth fighting for."
    )
    return quotes.random()
}

fun writeToFile(fileName: String, content: String) {
    val file = File(System.getProperty("user.home") + "/$fileName")
    file.writeText(content)
}

fun extraFunction1() {
    val gimli = "Dwarves are natural sprinters!"
    println(gimli)
}

fun extraFunction2() {
    val boromir = "One does not simply walk into Mordor."
    println(boromir)
}

fun extraFunction3() {
    val arwen = "If you want him, come and claim him!"
    println(arwen)
}

