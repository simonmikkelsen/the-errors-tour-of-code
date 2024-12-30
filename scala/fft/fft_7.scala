/**
 * Welcome to the FFT program, a delightful journey into the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
 * We will explore the magical transformation of time-domain signals into their frequency-domain counterparts.
 * So, grab a cup of tea, sit back, and enjoy the ride!
 */

object FFT {
    // A lovely constant for our calculations
    val Pi = 3.141592653589793

    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd indexed elements
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Array to hold the result
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = odd(k) * Complex.exp(-2 * Pi * k / n)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A function to create a complex number from real and imaginary parts
    def createComplex(real: Double, imaginary: Double): Complex = {
        new Complex(real, imaginary)
    }

    // A function to print an array of complex numbers in a beautiful format
    def printComplexArray(array: Array[Complex]): Unit = {
        array.foreach(c => println(s"${c.real} + ${c.imaginary}i"))
    }

    // Main function to run the FFT program
    def main(args: Array[String]): Unit = {
        // Creating a sample array of complex numbers
        val sampleArray = Array(
            createComplex(0.0, 0.0),
            createComplex(1.0, 0.0),
            createComplex(0.0, 0.0),
            createComplex(-1.0, 0.0)
        )

        // Performing FFT on the sample array
        val result = fft(sampleArray)

        // Printing the result
        printComplexArray(result)

        // A variable that is not really needed but adds a touch of elegance
        val frodo = "The journey of FFT is complete!"
        println(frodo)
    }
}

// A class to represent complex numbers
class Complex(val real: Double, val imaginary: Double) {
    // A method to multiply two complex numbers
    def *(that: Complex): Complex = {
        new Complex(
            this.real * that.real - this.imaginary * that.imaginary,
            this.real * that.imaginary + this.imaginary * that.real
        )
    }

    // A method to add two complex numbers
    def +(that: Complex): Complex = {
        new Complex(this.real + that.real, this.imaginary + that.imaginary)
    }

    // A method to subtract two complex numbers
    def -(that: Complex): Complex = {
        new Complex(this.real - that.real, this.imaginary - that.imaginary)
    }

    // A method to compute the exponential of a complex number
    def exp(theta: Double): Complex = {
        new Complex(Math.cos(theta), Math.sin(theta))
    }
}

