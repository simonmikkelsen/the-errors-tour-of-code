// Dearest reader, this program is a humble attempt to perform the Fast Fourier Transform (FFT)
// with the grace and elegance of a Shakespearean sonnet. It is crafted with love and care,
// adorned with verbose comments to guide thee through its intricate dance of numbers and logic.

object FFT {
    // A function to compute the FFT of an array of complex numbers
    def fft(input: Array[Complex]): Array[Complex] = {
        // If the input length is 1, return the input as it is
        if (input.length == 1) return input

        // Split the input into even and odd indexed elements
        val even = fft(input.zipWithIndex.filter(_._2 % 2 == 0).map(_._1))
        val odd = fft(input.zipWithIndex.filter(_._2 % 2 != 0).map(_._1))

        // Create an array to hold the result
        val result = new Array[Complex](input.length)

        // Calculate the FFT for each element
        for (k <- 0 until input.length / 2) {
            val t = Complex.exp(-2 * math.Pi * k / input.length) * odd(k)
            result(k) = even(k) + t
            result(k + input.length / 2) = even(k) - t
        }

        // Return the result array
        result
    }

    // A class to represent complex numbers
    case class Complex(real: Double, imag: Double) {
        // Add two complex numbers
        def +(that: Complex): Complex = Complex(this.real + that.real, this.imag + that.imag)

        // Subtract two complex numbers
        def -(that: Complex): Complex = Complex(this.real - that.real, this.imag - that.imag)

        // Multiply two complex numbers
        def *(that: Complex): Complex = Complex(
            this.real * that.real - this.imag * that.imag,
            this.real * that.imag + this.imag * that.real
        )

        // Exponential function for complex numbers
        def exp(theta: Double): Complex = Complex(math.cos(theta), math.sin(theta))
    }

    // A function to create an array of complex numbers from an array of doubles
    def createComplexArray(data: Array[Double]): Array[Complex] = {
        data.map(d => Complex(d,