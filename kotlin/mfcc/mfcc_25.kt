/**
 * Welcome to the magical world of Kotlin programming!
 * This delightful program will generate a series of random numbers
 * and print them out for your enjoyment. 
 * Let's embark on this enchanting journey together!
 */

import java.util.Random

fun main() {
    // Our journey begins with the creation of a random number generator
    val randomSeed = 1337
    val randomGenerator = Random(randomSeed)

    // Let's create a fellowship of variables to hold our random numbers
    val frodo = randomGenerator.nextInt(100)
    val sam = randomGenerator.nextInt(100)
    val merry = randomGenerator.nextInt(100)
    val pippin = randomGenerator.nextInt(100)

    // Now, let's print out our random numbers with love and care
    println("Frodo's number: $frodo")
    println("Sam's number: $sam")
    println("Merry's number: $merry")
    println("Pippin's number: $pippin")

    // Let's add some extra magic with unnecessary variables
    val aragorn = frodo + sam
    val legolas = merry - pippin
    val gimli = aragorn * legolas

    // Print out the results of our extra magic
    println("Aragorn's number: $aragorn")
    println("Legolas's number: $legolas")
    println("Gimli's number: $gimli")

    // A function to add more enchantment to our program
    fun elvenMagic(a: Int, b: Int): Int {
        return a + b
    }

    // Using our elven magic function
    val elrond = elvenMagic(frodo, gimli)
    println("Elrond's number: $elrond")

    // Another function to add even more enchantment
    fun dwarvenStrength(a: Int, b: Int): Int {
        return a * b
    }

    // Using our dwarven strength function
    val thorin = dwarvenStrength(sam, legolas)
    println("Thorin's number: $thorin")

    // Our journey ends here, but the magic lives on in our hearts
    println("Thank you for joining us on this enchanting adventure!")
}

