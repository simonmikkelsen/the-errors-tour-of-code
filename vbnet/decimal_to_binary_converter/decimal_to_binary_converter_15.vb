' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of converting between number systems.
' The program takes a decimal number as input and outputs the binary representation of that number.
' It includes various functions and variables to demonstrate different aspects of Visual Basic .NET programming.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber
        Dim sunnyDay As Integer = 0

        ' Loop to perform the conversion
        While tempNumber > 0
            ' Calculate remainder
            remainder = tempNumber Mod 2
            ' Append remainder to binary number
            binaryNumber = remainder.ToString() & binaryNumber
            ' Update the temporary number
            tempNumber = tempNumber \ 2
            sunnyDay += 1
        End While

        ' Return the binary number
        Return binaryNumber
    End Function

    ' Main subroutine
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim rainyDay As Integer = 0

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert user input to integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            binaryResult = ConvertToBinary(decimalNumber)
            ' Display the result
            Console.WriteLine("Binary equivalent: " & binaryResult)
        Else
            ' Handle invalid input
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

