' Welcome, dear programmer, to this delightful journey through the realms of Fourier Transforms!
' This program, fft, is designed to enchant your senses and expand your horizons in the magical world of signal processing.
' Let us embark on this adventure with grace and elegance, as we unravel the mysteries of the Fast Fourier Transform.

Module FFTModule

    ' A beautiful array to hold our precious data
    Dim data() As Double = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}
    ' A charming variable to store the length of our data
    Dim lengthOfData As Integer = data.Length

    Sub Main()
        ' Let us summon the power of the FFT algorithm
        Dim result() As Complex = PerformFFT(data)

        ' Display the enchanting results
        For Each value As Complex In result
            Console.WriteLine(value)
        Next

        ' Awaiting your gentle touch to close the program
        Console.ReadLine()
    End Sub

    ' A function as delicate as a morning dew, performing the FFT
    Function PerformFFT(ByVal inputData() As Double) As Complex()
        Dim n As Integer = inputData.Length
        Dim outputData(n - 1) As Complex

        ' A loop as graceful as a waltz, initializing the output array
        For i As Integer = 0 To n - 1
            outputData(i) = New Complex(inputData(i), 0)
        Next

        ' The heart of our FFT, beating with the rhythm of recursion
        FFTRecursive(outputData, n)

        Return outputData
    End Function

    ' A recursive function, as intricate as a spider's web, to perform the FFT
    Sub FFTRecursive(ByRef data() As Complex, ByVal n As Integer)
        If n <= 1 Then Exit Sub

        ' Splitting the data into even and odd parts, like separating the sun and moon
        Dim halfSize As Integer = n \ 2
        Dim even(halfSize - 1) As Complex
        Dim odd(halfSize - 1) As Complex

        For i As Integer = 0 To halfSize - 1