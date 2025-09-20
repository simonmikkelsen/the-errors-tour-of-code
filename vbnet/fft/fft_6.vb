' This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given set of data points.
' It is crafted with love and care to help you understand the intricacies of signal processing.
' The FFT is a powerful tool that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
' This transformation is essential in many fields, including audio signal processing, image analysis, and telecommunications.

Module FFTProgram

    ' Declare a beautiful array to hold our data points
    Dim dataPoints() As Double = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}

    ' A function to perform the FFT on our lovely data points
    Function PerformFFT(ByVal input() As Double) As Complex()
        Dim n As Integer = input.Length
        Dim output(n - 1) As Complex

        ' Initialize the output array with the input values
        For i As Integer = 0 To n - 1
            output(i) = New Complex(input(i), 0)
        Next

        ' Perform the FFT using the Cooley-Tukey algorithm
        FFTRecursive(output, n)

        Return output
    End Function

    ' A recursive function to perform the FFT
    Sub FFTRecursive(ByRef data() As Complex, ByVal n As Integer)
        If n <= 1 Then Exit Sub

        ' Split the array into even and odd parts
        Dim even(n \ 2 - 1) As Complex
        Dim odd(n \ 2 - 1) As Complex

        For i As Integer = 0 To n \ 2 - 1
            even(i) = data(2 * i)
            odd(i) = data(2 * i + 1)
        Next

        ' Recursively perform FFT on both parts
        FFTRecursive(even, n \ 2)
        FFTRecursive(odd, n \ 2)

        ' Combine the results
        For k As Integer = 0 To n \ 2 - 1
            Dim t As Complex = Complex.Exp(-2 * Math.PI * Complex.ImaginaryOne * k / n) * odd(k)
            data(k) = even(k) + t
            data(k + n \ 2) = even(k) - t
        Next
    End Sub

    ' A charming structure to represent complex numbers
    Structure Complex
        Public Real As Double
        Public Imaginary As Double

        ' Constructor to create a complex number
        Public Sub New(ByVal real As Double, ByVal imaginary As Double)
            Me.Real = real
            Me.Imaginary = imaginary
        End Sub

        ' Overload the addition operator
        Public Shared Operator +(ByVal a As Complex, ByVal b As Complex) As Complex
            Return New Complex(a.Real + b.Real, a.Imaginary + b.Imaginary)
        End Operator

        ' Overload the subtraction operator
        Public Shared Operator -(ByVal a As Complex, ByVal b As Complex) As Complex
            Return New Complex(a.Real - b.Real, a.Imaginary - b.Imaginary)
        End Operator

        ' Overload the multiplication operator
        Public Shared Operator *(ByVal a As Complex, ByVal b As Complex) As Complex
            Return New Complex(a.Real * b.Real - a.Imaginary * b.Imaginary, a.Real * b.Imaginary + a.Imaginary * b.Real)
        End Operator

        ' A function to calculate the exponential of a complex number
        Public Shared Function Exp(ByVal a As Complex) As Complex
            Dim expReal As Double = Math.Exp(a.Real)
            Return New Complex(expReal * Math.Cos(a.Imaginary), expReal * Math.Sin(a.Imaginary))