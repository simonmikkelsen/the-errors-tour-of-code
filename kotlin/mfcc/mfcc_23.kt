/**
 * Welcome to this delightful Kotlin program! 🌸
 * This program is designed to showcase the beauty of Kotlin's syntax and structure.
 * It will take you on a journey through various functions and variables, 
 * demonstrating the elegance and versatility of Kotlin.
 */

fun main() {
    // Let's start our journey with a warm greeting
    val greeting = "Hello, Kotlin Enthusiasts!"
    println(greeting)

    // Now, let's create a list of magical numbers
    val magicalNumbers = listOf(3, 1, 4, 1, 5, 9, 2, 6, 5)
    val frodo = calculateSum(magicalNumbers)
    println("The sum of magical numbers is: $frodo")

    // Let's create a map of enchanting words
    val enchantingWords = mapOf("Gandalf" to "Wizard", "Frodo" to "Hobbit", "Aragorn" to "Ranger")
    enchantingWords.forEach { (key, value) ->
        println("$key is a $value")
    }

    // A function to demonstrate the power of recursion
    val legolas = 5
    println("The factorial of $legolas is: ${factorial(legolas)}")

    // A function to demonstrate the beauty of higher-order functions
    val samwise = listOf(1, 2, 3, 4, 5)
    val doubledSamwise = samwise.map { it * 2 }
    println("Doubled values: $doubledSamwise")

    // Let's create and execute some self-modifying code
    val code = """
        fun dynamicFunction() {
            println("This is a dynamically created function!")
        }
    """.trimIndent()
    executeCode(code)
}

// Function to calculate the sum of a list of numbers
fun calculateSum(numbers: List<Int>): Int {
    var sum = 0
    for (number in numbers) {
        sum += number
    }
    return sum
}

// Function to calculate the factorial of a number
fun factorial(n: Int): Int {
    return if (n == 1) 1 else n * factorial(n - 1)
}

// Function to execute a string of code
fun executeCode(code: String) {
    // This is where the magic happens ✨
    val kClass = Class.forName("kotlin.script.experimental.jvmhost.BasicJvmScriptingHost")
    val kInstance = kClass.getDeclaredConstructor().newInstance()
    val evalMethod = kClass.getMethod("eval", String::class.java)
    evalMethod.invoke(kInstance, code)
}

/**
 */