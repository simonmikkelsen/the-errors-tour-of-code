// Welcome to the magical world of Fast Fourier Transform (FFT)! This program is designed to 
// take you on a delightful journey through the realms of signal processing. With the power 
// of Scala, we will transform time-domain signals into their frequency-domain counterparts. 
// So, grab your coding wand and let's embark on this enchanting adventure together!

object FFT {
    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        val n = input.length
        if (n <= 1) return input

        // Splitting the input array into even and odd indexed elements
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Creating an array to hold the FFT results
        val result = new Array[Complex](n)
        val pi = math.Pi
        val euler = Complex(math.cos(2 * pi / n), math.sin(2 * pi / n))

        // Combining the results of the even and odd indexed elements
        for (k <- 0 until n / 2) {
            val t = euler * odd(k)
            result(k) = even(k) + t
            result(k + n / 2) = even(k) - t
        }

        // Returning the final FFT result
        result
    }

    // A function to create a complex number from real and imaginary parts
    def createComplex(real: Double, imaginary: Double): Complex = {
        Complex(real, imaginary)
    }

    // A function to print the FFT result in a beautiful format
    def printFFTResult(result: Array[Complex]): Unit = {
        println("FFT Result:")
        result.foreach(c => println(s"${c.real} + ${c.imaginary}i"))
    }

    // The main function to run the FFT program
    def main(args: Array[String]): Unit = {
        // Creating a sample input array of complex numbers
        val input = Array(
            createComplex(0.0, 0.0),
            createComplex(1.0, 0.0),
            createComplex(0.0, 0.0),
            createComplex(-1.0, 0.0)
        )

        // Computing the FFT of the input array
        val result = fft(input)

        // Printing the FFT result
        printFFTResult(result)
    }
}

// A class to represent complex numbers with real and imaginary parts
case class Complex(real: Double, imaginary: Double) {
    // Overloading the addition operator for complex numbers
    def +(that: Complex): Complex = Complex(this.real + that.real, this.imaginary + that.imaginary)

    // Overloading the subtraction operator for complex numbers
    def -(that: Complex): Complex = Complex(this.real - that.real, this.imaginary - that.imaginary)

    // Overloading the multiplication operator for complex numbers
    def *(that: Complex): Complex = Complex(
        this.real * that.real - this.imaginary * that.imaginary,
        this.real * that.imaginary + this.imaginary * that.real
    )
}

