' Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
' This program is designed to bring joy and understanding to the hearts of programmers everywhere.
' It will take you through the magical process of transforming time-domain data into frequency-domain data.

Module FFTProgram

    ' Declare a variable to hold the size of the input array
    Dim arraySize As Integer = 1024

    ' Declare an array to hold the input data
    Dim inputData(arraySize) As Double

    ' Declare an array to hold the output data
    Dim outputData(arraySize) As Double

    ' Function to initialize the input data with some lovely values
    Sub InitializeInputData()
        For i As Integer = 0 To arraySize - 1
            inputData(i) = Math.Sin(2 * Math.PI * i / arraySize)
        Next
    End Sub

    ' Function to perform the FFT
    Sub PerformFFT()
        Dim n As Integer = arraySize
        Dim m As Integer = Math.Log(n) / Math.Log(2)
        Dim j As Integer = 0

        ' Bit-reversal permutation
        For i As Integer = 0 To n - 1
            If i < j Then
                Dim temp As Double = inputData(i)
                inputData(i) = inputData(j)
                inputData(j) = temp
            End If
            Dim k As Integer = n / 2
            While k <= j
                j -= k
                k /= 2
            End While
            j += k
        Next

        ' Danielson-Lanczos section
        Dim l As Integer = 1
        For l2 As Integer = 1 To m
            Dim l1 As Integer = l
            l *= 2
            Dim u1 As Double = 1.0
            Dim u2 As Double = 0.0
            Dim theta As Double = Math.PI / l1
            Dim w1 As Double = Math.Cos(theta)
            Dim w2 As Double = -Math.Sin(theta)
            For