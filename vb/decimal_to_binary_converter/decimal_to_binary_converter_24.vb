' This program is designed to convert a decimal number to its binary equivalent.
' It is a simple utility to help programmers understand the process of conversion
' from one numerical base to another. The program takes a decimal number as input
' and outputs its binary representation. The program also demonstrates the use of
' various programming constructs and techniques in Visual Basic.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber

        ' Loop until the decimal number is greater than zero
        While tempDecimal > 0
            ' Calculate the remainder when the decimal number is divided by 2
            remainder = tempDecimal Mod 2
            ' Append the remainder to the binary number string
            binaryNumber = remainder.ToString() & binaryNumber
            ' Divide the decimal number by 2
            tempDecimal = tempDecimal \ 2
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
        Dim sunnyDay As String = "Sunny"
        Dim rainyDay As String = "Rainy"

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            binaryResult = ConvertToBinary(decimalNumber)
            ' Display the result
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Close the console (resource) before displaying the result
        Console.Close()

        ' Display a friendly message
        Console.WriteLine("Thank you for using the Decimal to Binary Converter!")
    End Sub

End Module

