/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the realms of binary digits,
 * transforming them into their glorious hexadecimal counterparts.
 * Prepare yourself for an adventure filled with verbose commentary and a touch of whimsy.
 */

import java.util.concurrent.Executors

fun main() {
    // Behold! The binary string that shall be transformed into hexadecimal splendor.
    val binaryString = "1101011010110101"

    // The executor service, a majestic tool for managing threads.
    val executor = Executors.newSingleThreadExecutor()

    // A variable to hold the final hexadecimal result, like a treasure chest waiting to be filled.
    var hexResult = ""

    // The task to convert binary to hexadecimal, a quest of great importance.
    val task = Runnable {
        hexResult = convertBinaryToHex(binaryString)
    }

    // Submit the task to the executor, setting the wheels of conversion in motion.
    executor.submit(task)

    // A brief pause to allow the task to complete its noble work.
    Thread.sleep(100)

    // The grand finale! Display the hexadecimal result for all to see.
    println("Hexadecimal: $hexResult")

    // Shutdown the executor, for its work here is done.
    executor.shutdown()
}

/**
 * A function of great renown, tasked with converting binary strings to their hexadecimal form.
 * @param binary The binary string, a sequence of 1s and 0s.
 * @return The hexadecimal representation, a string of alphanumeric characters.
 */
fun convertBinaryToHex(binary: String): String {
    // A variable to hold the intermediate decimal value, like a bridge between worlds.
    var decimalValue = 0

    // A loop to traverse the binary string, converting it to a decimal value.
    for (i in binary.indices) {
        // The power of two, a force to be reckoned with.
        val power = binary.length - i - 1

        // The binary digit at the current position, a humble 1 or 0.
        val digit = binary[i].toString().toInt()

        // Accumulate the decimal value, step by step.
        decimalValue += digit * Math.pow(2.0, power.toDouble()).toInt()
    }

    // Convert the decimal value to hexadecimal, a transformation of great beauty.
    return decimalValue.toString(16).toUpperCase()
}

