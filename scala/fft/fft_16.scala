// Welcome to the magical world of Fast Fourier Transform (FFT) in Scala!
// This program is designed to take you on a journey through the mystical realms of signal processing.
// We will transform signals from the time domain to the frequency domain using the FFT algorithm.
// Along the way, we will encounter various enchanting variables and functions that will guide us through this adventure.

object FFT {
    // Function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length

        // Base case: if the input length is 1, return the input
        if (n == 1) return input

        // Recursive case: divide the input into even and odd parts
        val even = fft(input.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = fft(input.zipWithIndex.collect { case (x, i) if i % 2 != 0 => x })

        // Combine the results
        val result = new Array[Complex](n)
        val w = Complex(1, 0)
        val wn = Complex(Math.cos(2 * Math.PI / n), Math.sin(2 * Math.PI / n))

        for (k <- 0 until n / 2) {
            val t = w * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
            w *= wn
        }

        result
    }

    // Function to create a complex number from a real number
    def toComplexArray(input: Array[Double]): Array[Complex] = {
        input.map(x => Complex(x, 0))
    }

    // Function to print an array of complex numbers
    def printComplexArray(input: Array[Complex]): Unit = {
        input.foreach(x => println(s"${x.re} + ${x.im}i"))
    }

    // Main function to run the FFT algorithm
    def main(args: Array[String]): Unit = {
        // Create an array of real numbers
        val realInput = Array(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)

        // Convert the real numbers to complex numbers
        val complexInput = toComplexArray(realInput)

        // Compute the FFT of the complex numbers
        val fftResult = fft(complexInput)

        // Print the FFT result
        printComplexArray(fftResult)
    }
}

// Class to represent a complex number
case class Complex(re: Double, im: Double) {
    // Function to add two complex numbers
    def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)

    // Function to subtract two complex numbers
    def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)

    // Function to multiply two complex numbers
    def *(that: Complex): Complex = Complex(
        this.re * that.re - this.im * that.im,
        this.re * that.im + this.im * that.re
    )
}

