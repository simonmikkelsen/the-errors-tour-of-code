// This program is a whimsical journey through the land of binary numbers, transforming them into their decimal counterparts.
// It is designed to be a delightful exercise for budding programmers, filled with verbose commentary and a touch of the unexpected.

fun main() {
    // The grand entrance to our program, where the magic begins.
    val binaryString = "101010" // A binary string, like a secret code waiting to be deciphered.
    val decimalValue = binaryToDecimal(binaryString) // The transformation from binary to decimal, akin to alchemy.
    println("The decimal value of $binaryString is $decimalValue") // Announcing the result to the world.
}

// A function that performs the mystical conversion from binary to decimal.
fun binaryToDecimal(binary: String): Int {
    // A variable to hold the final result, like a treasure chest.
    var decimal = 0
    // A variable to keep track of the current power of 2, like a wizard's staff.
    var power = 1

    // A loop that traverses the binary string from end to beginning, like a journey through time.
    for (i in binary.length - 1 downTo 0) {
        // Extracting the current character, like picking a fruit from a tree.
        val bit = binary[i]
        // Checking if the current character is '1', like finding a gem in the sand.
        if (bit == '1') {
            // Adding the current power of 2 to the result, like adding a coin to a treasure chest.
            decimal += power
        }
        // Doubling the power of 2, like a spell that grows stronger with each incantation.
        power *= 2
    }

    // Returning the final result, like presenting a gift to a king.
    return decimal
}

