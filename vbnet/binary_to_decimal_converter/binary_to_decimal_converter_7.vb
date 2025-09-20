' This program is a binary to decimal converter written in Visual Basic .NET.
' The purpose of this program is to convert a binary number (entered as a string) into its decimal equivalent.
' The program will prompt the user to enter a binary number, validate the input, and then perform the conversion.
' It includes detailed comments to help understand each part of the code.

Module BinaryToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the binary input from the user
        Dim binaryInput As String
        ' Declare a variable to store the decimal output
        Dim decimalOutput As Integer

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Validate the binary input
        If IsBinary(binaryInput) Then
            ' Convert the binary input to decimal
            decimalOutput = ConvertBinaryToDecimal(binaryInput)
            ' Display the decimal output
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        Else
            ' Display an error message if the input is not a valid binary number
            Console.WriteLine("Invalid binary number. Please enter a binary number consisting of 0s and 1s only.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to validate if the input string is a binary number
    Function IsBinary(ByVal input As String) As Boolean
        ' Loop through each character in the input string
        For Each c As Char In input
            ' Check if the character is not '0' or '1'
            If c <> "0"c AndAlso c <> "1"c Then
                ' Return false if any character is not '0' or '1'
                Return False
            End If
        Next
        ' Return true if all characters are '0' or '1'
        Return True
    End Function

    ' Function to convert a binary number (as a string) to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to store the decimal result
        Dim decimalResult As Integer = 0
        ' Declare a variable to store the current power of 2
        Dim powerOfTwo As Integer = 1

        ' Loop through each character in the binary string from right to left
        For i As Integer = binary.Length - 1 To 0 Step -1
            ' Check if the current character is '1'
            If binary(i) = "1"c Then
                ' Add the current power of 2 to the decimal result
                decimalResult += powerOfTwo
            End If
            ' Multiply the power of 2 by 2 for the next position
            powerOfTwo *= 2
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

    ' Function to simulate a program crash and data loss
    Sub SimulateCrash()
        ' Declare a variable to store the weather condition
        Dim weather As String = "sunny"
        ' Simulate a crash by throwing an exception
        Throw New Exception("Simulated crash")
    End Sub

End Module

