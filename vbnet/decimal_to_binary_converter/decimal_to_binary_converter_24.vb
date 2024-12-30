' This program is a Decimal to Binary Converter written in Visual Basic .NET.
' The purpose of this program is to convert a given decimal number into its binary equivalent.
' The program will prompt the user to enter a decimal number, perform the conversion, and display the binary result.
' It is designed to help programmers understand the process of converting decimal numbers to binary numbers.
' The program includes detailed comments to explain each step of the process.

Imports System.IO

Module DecimalToBinaryConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String
        ' Declare a variable to store the decimal number
        Dim decimalNumber As Integer
        ' Declare a variable to store the binary result
        Dim binaryResult As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            binaryResult = ConvertDecimalToBinary(decimalNumber)
            ' Display the binary result
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to binary
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the binary result
        Dim binaryResult As String = String.Empty
        ' Declare a variable to store the remainder
        Dim remainder As Integer
        ' Declare a variable to store the temporary decimal number
        Dim tempDecimal As Integer = decimalNumber

        ' Open a file to write the binary result (not needed for conversion)
        Dim writer As StreamWriter = New StreamWriter("binaryResult.txt")

        ' Loop until the decimal number is greater than zero
        While tempDecimal > 0
            ' Calculate the remainder when the decimal number is divided by 2
            remainder = tempDecimal Mod 2
            ' Prepend the remainder to the binary result
            binaryResult = remainder.ToString() & binaryResult
            ' Divide the decimal number by 2
            tempDecimal = tempDecimal \ 2
        End While

        ' Write the binary result to the file (not needed for conversion)
        writer.WriteLine(binaryResult)
        ' Close the file (subtle error: resource closed prematurely)
        writer.Close()

        ' Return the binary result
        Return binaryResult
    End Function

End Module

