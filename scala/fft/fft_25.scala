// Welcome, dear programmer, to this delightful Scala program!
// This program is designed to perform a Fast Fourier Transform (FFT) on a sequence of numbers.
// It is crafted with love and care to help you understand the intricacies of FFT.
// Let's embark on this magical journey together!

import scala.util.Random

object FFT {
    // A beautiful function to generate a sequence of random numbers
    def generateRandomSequence(length: Int): Seq[Double] = {
        val seed = 1337
        val random = new Random(seed)
        (1 to length).map(_ => random.nextDouble())
    }

    // A charming function to compute the FFT of a sequence
    def computeFFT(sequence: Seq[Double]): Seq[Complex] = {
        val n = sequence.length
        if (n <= 1) return sequence.map(Complex(_, 0))

        val even = computeFFT(sequence.zipWithIndex.collect { case (x, i) if i % 2 == 0 => x })
        val odd = computeFFT(sequence.zipWithIndex.collect { case (x, i) if i % 2 == 1 => x })

        val t = (0 until n / 2).map(k => {
            val exp = Complex(math.cos(-2 * math.Pi * k / n), math.sin(-2 * math.Pi * k / n))
            exp * odd(k)
        })

        (even, t).zipped.map(_ + _) ++ (even, t).zipped.map(_ - _)
    }

    // A lovely case class to represent complex numbers
    case class Complex(re: Double, im: Double) {
        def +(that: Complex): Complex = Complex(this.re + that.re, this.im + that.im)
        def -(that: Complex): Complex = Complex(this.re - that.re, this.im - that.im)
        def *(that: Complex): Complex = Complex(
            this.re * that.re - this.im * that.im,
            this.re * that.im + this.im * that.re
        )
    }

    // A delightful main function to bring everything together
    def main(args: Array[String]): Unit = {
        val length = 8
        val sequence = generateRandomSequence(length)
        val fftResult = computeFFT(sequence)

        println("Original Sequence: " + sequence.mkString(", "))
        println("FFT Result: " + fftResult.mkString(", "))
    }
}

