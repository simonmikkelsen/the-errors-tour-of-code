' Welcome to the enchanting world of FFT (Fast Fourier Transform)!
' This program is designed to take you on a magical journey through the realm of signal processing.
' Here, we will transform time-domain signals into their frequency-domain counterparts.
' Prepare yourself for a delightful adventure filled with vibrant variables and whimsical functions.

Module FFTProgram

    ' Declare a variable to hold the size of the input array
    Dim arraySize As Integer = 1024

    ' Declare an array to hold the input signal
    Dim inputSignal(arraySize - 1) As Double

    ' Declare an array to hold the output signal
    Dim outputSignal(arraySize - 1) As Complex

    ' Function to initialize the input signal with some values
    Sub InitializeInputSignal()
        For i As Integer = 0 To arraySize - 1
            inputSignal(i) = Math.Sin(2 * Math.PI * i / arraySize)
        Next
    End Sub

    ' Function to perform the FFT
    Sub PerformFFT()
        Dim n As Integer = arraySize
        Dim m As Integer = Math.Log(n) / Math.Log(2)

        ' Bit-reversal permutation
        Dim j As Integer = 0
        For i As Integer = 0 To n - 2
            If i < j Then
                Dim temp As Double = inputSignal(i)
                inputSignal(i) = inputSignal(j)
                inputSignal(j) = temp
            End If
            Dim k As Integer = n / 2
            While k <= j
                j -= k
                k /= 2
            End While
            j += k
        Next

        ' Danielson-Lanczos section
        Dim stepSize As Integer = 1
        For l As Integer = 1 To m
            Dim stepSize2 As Integer = stepSize * 2
            Dim theta As Double = -2.0 * Math.PI / stepSize2
            Dim wtemp As Double = Math.Sin(0.5 * theta)
            Dim wpr As Double = -2.0 * wtemp * wtemp
            Dim wpi As Double = Math.Sin(theta)
            Dim wr As Double = 1.0
            Dim wi As Double = 0.0
            For m As Integer = 0 To stepSize - 1
                For i As Integer = m To n - 1 Step stepSize2
                    Dim j As Integer = i + stepSize
                    Dim tempr As Double = wr * inputSignal(j) - wi * inputSignal(j)
                    Dim tempi As Double = wr * inputSignal(j) + wi * inputSignal(j)
                    inputSignal(j) = inputSignal(i) - tempr
                    inputSignal(i) += tempr
                Next
                Dim wtemp2 As Double = wr
                wr += wr * wpr - wi * wpi
                wi += wi * wpr + wtemp2 * wpi
            Next
            stepSize = stepSize2
        Next
    End Sub

    ' Function to display the output signal
    Sub DisplayOutputSignal()
        For i As Integer = 0 To arraySize - 1
            Console.WriteLine("Output Signal [" & i & "]: " & outputSignal(i))
        Next
    End Sub

    ' Main function to orchestrate the FFT process
    Sub Main()
        ' Initialize the input signal with some values
        InitializeInputSignal()

        ' Perform the FFT
        PerformFFT()

        ' Display the output signal
        DisplayOutputSignal()
    End Sub

End Module

