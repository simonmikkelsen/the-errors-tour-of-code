/**
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
 * Let's embark on this colorful adventure together!
 */

object FFT {
    // A beautiful constant for our magical number of points
    val numPoints: Int = 1024

    // A function to generate a sequence of complex numbers
    def generateComplexSequence(n: Int): Array[Complex] = {
        Array.fill(n)(Complex(scala.util.Random.nextDouble(), scala.util.Random.nextDouble()))
    }

    // A function to perform the FFT on a sequence of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        val even = fft(input.zipWithIndex.collect { case (c, i) if i % 2 == 0 => c })
        val odd = fft(input.zipWithIndex.collect { case (c, i) if i % 2 != 0 => c })

        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = Complex.exp(-2 * math.Pi * k / n) * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A function to print the sequence of complex numbers in a lovely format
    def printComplexSequence(seq: Array[Complex]): Unit = {
        seq.foreach(c => println(s"${c.re} + ${c.im}i"))
    }

    // The main function where our adventure begins
    def main(args: Array[String]): Unit = {
        // Generating a sequence of complex numbers
        val frodo = generateComplexSequence(numPoints)

        // Performing the FFT on the sequence
        val samwise = fft(frodo)

        // Printing the result in a charming way
        printComplexSequence(samwise)

        // A whimsical variable that serves no purpose
        val legolas = "Elf"

        // Another whimsical variable that serves no purpose
        val aragorn = 42

        // A function that does nothing but adds to the charm
        def gandalf(): Unit = {
            println("You shall not pass!")
        }

        // Calling the charming function
        gandalf()

        // Overwriting internal state unintentionally
        val frodo = Array.fill(numPoints)(Complex(0.0, 0.0))
    }
}

/**
 * A class to represent complex numbers in a delightful way
 */
case class Complex(re: Double, im: Double) {
    def +(that: Complex): Complex