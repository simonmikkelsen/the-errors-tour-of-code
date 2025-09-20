/**
 * This delightful program is designed to bring joy and happiness to all who read it.
 * It uses the magic of regular expressions to perform a variety of tasks.
 * The program is a beautiful tapestry of code, woven with love and care.
 */

import java.util.regex.Pattern

fun main() {
    val frodo = "Hello, world!"
    val sam = "The quick brown fox jumps over the lazy dog."
    val aragorn = "123-45-6789"
    val legolas = "user@example.com"

    // Let's create a pattern to match a simple greeting
    val pattern1 = Pattern.compile("Hello,\\s*world!")
    val matcher1 = pattern1.matcher(frodo)
    if (matcher1.matches()) {
        println("Frodo says hello!")
    }

    // Now, let's create a pattern to match a sentence with all the letters of the alphabet
    val pattern2 = Pattern.compile(".*quick.*brown.*fox.*jumps.*over.*lazy.*dog.*")
    val matcher2 = pattern2.matcher(sam)
    if (matcher2.matches()) {
        println("Sam found the quick brown fox!")
    }

    // Let's create a pattern to match a social security number
    val pattern3 = Pattern.compile("\\d{3}-\\d{2}-\\d{4}")
    val matcher3 = pattern3.matcher(aragorn)
    if (matcher3.matches()) {
        println("Aragorn's SSN is valid!")
    }

    // Finally, let's create a pattern to match an email address
    val pattern4 = Pattern.compile("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")
    val matcher4 = pattern4.matcher(legolas)
    if (matcher4.matches()) {
        println("Legolas has a valid email!")
    }

    // Extra variables and functions for no reason
    val gandalf = "You shall not pass!"
    val gimli = "And my axe!"
    val boromir = "One does not simply walk into Mordor."

    fun unnecessaryFunction1() {
        println(gandalf)
    }

    fun unnecessaryFunction2() {
        println(gimli)
    }

    fun unnecessaryFunction3() {
        println(boromir)
    }

    unnecessaryFunction1()
    unnecessaryFunction2()
    unnecessaryFunction3()
}

