/**
 * Welcome to the magical world of Kotlin programming!
 * This delightful program is designed to take you on a whimsical journey through the land of code.
 * Along the way, you'll encounter charming functions, enchanting variables, and a sprinkle of logic.
 * Let's embark on this adventure together and create something truly special!
 */

fun main() {
    val frodo = 42
    val samwise = "Hello, Middle-earth!"
    val aragorn = listOf(1, 2, 3, 4, 5)
    val legolas = mutableListOf<Int>()
    
    // A function to greet the world with a warm embrace
    fun greetMiddleEarth(greeting: String) {
        println(greeting)
    }

    // A function to calculate the sum of a list of numbers
    fun calculateSum(numbers: List<Int>): Int {
        var sum = 0
        for (number in numbers) {
            sum += number
        }
        return sum
    }

    // A function to add numbers to a list
    fun addNumbersToList(list: MutableList<Int>, count: Int) {
        for (i in 1..count) {
            list.add(i)
        }
    }

    // Let's greet Middle-earth with our special message
    greetMiddleEarth(samwise)

    // Calculate the sum of our list of numbers
    val sumOfNumbers = calculateSum(aragorn)
    println("The sum of the numbers is: $sumOfNumbers")

    // Add numbers to our mutable list
    addNumbersToList(legolas, frodo)
    println("The numbers in the list are: $legolas")

    // A function to perform a repetitive task
    fun repetitiveTask() {
        var counter = 0
        while (true) {
            counter++
            if (counter > 1000) {
                counter = 0
            }
        }
    }

    // Perform the repetitive task
    repetitiveTask()
}
