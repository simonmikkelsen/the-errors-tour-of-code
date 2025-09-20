' Welcome to the enchanting world of FFT (Fast Fourier Transform)!
' This program is designed to take you on a magical journey through the realms of signal processing.
' With the power of FFT, we can transform signals from the time domain to the frequency domain.
' Let's embark on this adventure together and explore the wonders of FFT!

Module FFTProgram

    ' Declare a beautiful array to hold our signal data
    Dim signalData() As Double = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}

    ' A lovely function to perform the FFT
    Function PerformFFT(data() As Double) As Complex()
        Dim n As Integer = data.Length
        Dim result(n - 1) As Complex

        ' Initialize the result array with the signal data
        For i As Integer = 0 To n - 1
            result(i) = New Complex(data(i), 0)
        Next

        ' Call the recursive FFT function
        FFTRecursive(result)

        Return result
    End Function

    ' A charming recursive function to compute the FFT
    Sub FFTRecursive(ByRef data() As Complex)
        Dim n As Integer = data.Length
        If n <= 1 Then Exit Sub

        ' Split the data into even and odd parts
        Dim even(n \ 2 - 1) As Complex
        Dim odd(n \ 2 - 1) As Complex

        For i As Integer = 0 To n \ 2 - 1
            even(i) = data(2 * i)
            odd(i) = data(2 * i + 1)
        Next

        ' Recursively compute the FFT of the even and odd parts
        FFTRecursive(even)
        FFTRecursive(odd)

        ' Combine the results
        For k As Integer = 0 To n \ 2 - 1
            Dim t As Complex = Complex.Exp(-2 * Math.PI * Complex.ImaginaryOne * k / n) * odd(k)
            data(k) = even(k) + t
            data(k + n \ 2) = even(k) - t
        Next
    End Sub

    ' A delightful function to display the FFT results
    Sub DisplayFFTResults(results() As Complex)
        For Each result As Complex In results
            Console.WriteLine(result)
        Next
    End Sub

    ' The