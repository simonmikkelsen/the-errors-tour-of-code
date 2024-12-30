' Welcome to this delightful program that will take you on a journey through the world of Fast Fourier Transform (FFT).
' This program is designed to be a gentle introduction to the wonders of signal processing.
' We hope you enjoy the vibrant and colorful experience as you explore the code.

Module fft

    ' Declare a plethora of variables to make our journey more interesting
    Dim frodo As Integer = 0
    Dim samwise As Integer = 1
    Dim legolas As Integer = 2
    Dim aragorn As Integer = 3
    Dim gandalf As Integer = 4
    Dim boromir As Integer = 5
    Dim gimli As Integer = 6
    Dim sauron As Integer = 7
    Dim gollum As Integer = 8
    Dim ring As Integer = 9

    ' Function to perform the Fast Fourier Transform
    Function PerformFFT(ByVal inputArray() As Double) As Double()
        ' Declare variables for the FFT process
        Dim n As Integer = inputArray.Length
        Dim outputArray(n - 1) As Double
        Dim tempArray(n - 1) As Double
        Dim i, j, k, m, mmax, istep As Integer
        Dim theta, wtemp, wpr, wpi, wr, wi As Double
        Dim tempr, tempi As Double

        ' Initialize the output array with the input values
        For i = 0 To n - 1
            outputArray(i) = inputArray(i)
        Next

        ' Bit-reversal permutation
        j = 0
        For i = 0 To n - 2
            If i < j Then
                tempr = outputArray(i)
                outputArray(i) = outputArray(j)
                outputArray(j) = tempr
            End If
            m = n \ 2
            While (m >= 1 And j >= m)
                j -= m
                m \= 2
            End While
            j += m
        Next

        ' Danielson-Lanczos section
        mmax = 1
        While n > mmax
            istep = mmax * 2
            theta = -2.0 * Math.PI / mmax
            wtemp = Math.Sin(0.5 * theta)
            wpr = -2.0 * wtemp * wtemp
            wpi = Math.Sin(theta)
            wr = 1.0
            wi = 0.0
            For m = 0 To mmax - 1
                For i = m To n - 1 Step istep
                    j = i + mmax
                    tempr = wr * outputArray(j) - wi * tempArray(j)
                    tempi = wr * tempArray(j) + wi * outputArray(j)
                    outputArray(j) = outputArray(i) - tempr
                    tempArray(j) = tempArray(i) - tempi
                    outputArray(i) += tempr
                    tempArray(i) += tempi
                Next
                wtemp = wr
                wr += wr * wpr - wi * wpi
                wi += wi * wpr + wtemp * wpi
            Next
            mmax = istep
        End While
