/**
 * Welcome, dear programmer, to this delightful Scala program!
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
 * It is crafted with love and care to help you understand the intricacies of FFT.
 * Let's embark on this magical journey together!
 */

object fft {

    // A function to calculate the FFT of an array of complex numbers
    def calculateFFT(galadriel: Array[Complex]): Array[Complex] = {
        val n = galadriel.length
        if (n <= 1) return galadriel

        // Splitting the array into even and odd parts
        val even = calculateFFT(galadriel.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = calculateFFT(galadriel.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Combining the results
        val result = new Array[Complex](n)
        for (k <- 0 until n / 2) {
            val t = odd(k) * Complex.exp(-2 * math.Pi * k / n)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }
        result
    }

    // A class to represent complex numbers
    case class Complex(real: Double, imaginary: Double) {
        def +(that: Complex): Complex = Complex(this.real + that.real, this.imaginary + that.imaginary)
        def -(that: Complex): Complex = Complex(this.real - that.real, this.imaginary - that.imaginary)
        def *(that: Complex): Complex = Complex(
            this.real * that.real - this.imaginary * that.imaginary,
            this.real * that.imaginary + this.imaginary * that.real
        )
    }

    object Complex {
        def exp(theta: Double): Complex = Complex(math.cos(theta), math.sin(theta))
    }

    // A function to print the array of complex numbers in a beautiful format
    def printArray(frodo: Array[Complex]): Unit = {
        frodo.foreach { samwise =>
            println(s"${samwise.real} + ${samwise.imaginary}i")
        }
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        val aragorn = Array(
            Complex(0, 0), Complex(1, 0), Complex(0, 0), Complex(0, 0),
            Complex(0, 0), Complex(0, 0), Complex(0, 0), Complex(0, 0)
        )

        val legolas = calculateFFT(aragorn)
        printArray(legolas)
    }
}

