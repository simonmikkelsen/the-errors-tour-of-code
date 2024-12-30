' This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given set of data.
' It is crafted with love and care to help budding programmers understand the intricacies of FFT.
' The program takes an array of complex numbers and transforms it into its frequency components.
' Let's embark on this magical journey together!

Imports System.Numerics

Module fft
    ' Declare a variable to hold the size of the input array
    Dim sizeOfArray As Integer = 8

    ' Function to perform the FFT
    Function PerformFFT(ByVal inputArray() As Complex) As Complex()
        ' Create an array to hold the output
        Dim outputArray(sizeOfArray - 1) As Complex

        ' Check if the input array length is a power of 2
        If (sizeOfArray And (sizeOfArray - 1)) <> 0 Then
            Throw New ArgumentException("Array length must be a power of 2")
        End If

        ' Call the recursive FFT function
        FFTRecursive(inputArray, outputArray, sizeOfArray, 1)

        ' Return the transformed array
        Return outputArray
    End Function

    ' Recursive function to perform the FFT
    Sub FFTRecursive(ByVal inputArray() As Complex, ByVal outputArray() As Complex, ByVal n As Integer, ByVal stepSize As Integer)
        ' Base case: if the size of the array is 1, copy the input to the output
        If n = 1 Then
            outputArray(0) = inputArray(0)
            Return
        End If

        ' Create arrays to hold the even and odd indexed elements
        Dim evenArray(n \ 2 - 1) As Complex
        Dim oddArray(n \ 2 - 1) As Complex

        ' Fill the even and odd arrays
        For i As Integer = 0 To n \ 2 - 1
            evenArray(i) = inputArray(i * 2)
            oddArray(i) = inputArray(i * 2 + 1)
        Next

        ' Create arrays to hold the FFT results of the even and odd arrays
        Dim evenFFT(n \ 2 - 1) As Complex
        Dim oddFFT(n \ 2 - 1) As Complex

        ' Recursively perform FFT on the even and odd arrays
        FFTRecursive(evenArray, evenFFT, n \ 2, stepSize * 2)
        FFTRecursive(oddArray, oddFFT, n \ 2, stepSize * 2)

        ' Combine the results of the even and odd FFTs
        For k As Integer = 0 To n \ 2 - 1
            Dim t As Complex = Complex.Exp(-2 * Math.PI * Complex.ImaginaryOne * k / n) * oddFFT(k)
            outputArray(k) = evenFFT(k) + t
            outputArray(k + n \ 2) = evenFFT(k) - t
        Next
    End Sub