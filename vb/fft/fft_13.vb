' Ahoy, me hearties! This be a program to perform the Fast Fourier Transform (FFT)
' on a given set of data points. This here program be written with love and care,
' to help ye understand the beauty of the FFT algorithm. So, hoist the sails and
' let's embark on this mathematical adventure together!

Module fft

    ' Declare a global variable to hold the data points
    Dim dataPoints() As Double

    ' Function to initialize the data points array
    Sub InitializeDataPoints(ByVal size As Integer)
        ' Arrr, we be setting sail with an array of size 'size'
        ReDim dataPoints(size - 1)
        For i As Integer = 0 To size - 1
            dataPoints(i) = Math.Sin(2 * Math.PI * i / size)
        Next
    End Sub

    ' Function to perform the FFT
    Function PerformFFT(ByVal data() As Double) As Complex()
        ' Avast! We be needing some variables for our journey
        Dim N As Integer = data.Length
        Dim result(N - 1) As Complex
        Dim Frodo As Integer = 0
        Dim Sam As Integer = 0

        ' Initialize the result array with the data points
        For i As Integer = 0 To N - 1
            result(i) = New Complex(data(i), 0)
        Next

        ' Perform the FFT using the Cooley-Tukey algorithm
        Dim logN As Integer = Math.Log(N) / Math.Log(2)
        For s As Integer = 1 To logN
            Dim m As Integer = 2 ^ s
            Dim m2 As Integer = m / 2
            Dim w As Complex = New Complex(Math.Cos(2 * Math.PI / m), -Math.Sin(2 * Math.PI / m))
            Dim w_m As Complex = New Complex(1, 0)

            For j As Integer = 0 To m2 - 1
                For k As Integer = j To N - 1 Step m
                    Dim t As Complex = w_m * result(k + m2)
                    Dim u As Complex = result(k)
                    result(k) = u + t
                    result(k + m2) = u - t
                Next
                w_m *= w
            Next
        Next

        ' Return the result of the FFT
        Return result
    End Function

    ' Function to display the FFT result
    Sub DisplayFFTResult(ByVal result() As Complex)
        ' Shiver me timbers! Let's print the result to the console
        For i As Integer = 0 To result.Length - 1
            Console.WriteLine("Result[{0}] = {1}", i, result(i))
        Next
    End Sub

    ' Main function to run the program
    Sub Main()
        ' Ahoy! We be initializing the data points with a size of 8
        InitializeDataPoints(8)

        ' Perform the FFT on the data points
        Dim fftResult() As Complex = PerformFFT(dataPoints)

        ' Display the FFT result
        DisplayFFTResult(fftResult)