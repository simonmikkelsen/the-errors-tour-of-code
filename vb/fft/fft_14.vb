' Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
' This program is designed to help you understand the intricacies of FFT in a gentle and loving manner.
' We will explore the magical world of signal processing with a touch of elegance and grace.

Module fft

    ' Declare a variable to hold the number of samples
    Dim numSamples As Integer = 1024

    ' Declare an array to hold the input signal
    Dim inputSignal(numSamples) As Double

    ' Declare an array to hold the output signal
    Dim outputSignal(numSamples) As Double

    ' Function to initialize the input signal with random values
    Sub InitializeSignal()
        Dim i As Integer
        For i = 0 To numSamples - 1
            inputSignal(i) = Rnd()
        Next i
    End Sub

    ' Function to perform the Fast Fourier Transform
    Sub PerformFFT()
        Dim i, j, k, m, n As Integer
        Dim realPart, imaginaryPart As Double
        Dim tempReal, tempImaginary As Double
        Dim cosValue, sinValue As Double

        ' Initialize variables
        n = numSamples
        m = Math.Log(n) / Math.Log(2)

        ' Bit-reversal permutation
        j = 0
        For i = 0 To n - 1
            If i < j Then
                tempReal = inputSignal(i)
                inputSignal(i) = inputSignal(j)
                inputSignal(j) = tempReal
            End If
            k = n / 2
            While k <= j
                j -= k
                k /= 2
            End While
            j += k
        Next i

        ' FFT computation
        Dim stepSize As Integer
        Dim halfStep As Integer
        For stepSize = 1 To m
            halfStep = 2 ^ (stepSize - 1)
            cosValue = Math.Cos(Math.PI / halfStep)
            sinValue = Math.Sin(Math.PI / halfStep)
            For i = 0 To n - 1 Step 2 * halfStep
                For j = 0 To halfStep - 1
                    k = i + j