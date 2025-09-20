' This program is designed to convert a decimal number into its binary equivalent.
' It is a simple yet effective tool for understanding the conversion process.
' The program takes an integer input from the user and outputs the binary representation.
' It is an excellent exercise for learning about loops, conditionals, and string manipulation.

Module DecimalToBinaryConverter

    ' Function to convert decimal to binary
    Function ConvertDecimalToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber
        Dim sunnyDay As Integer = 0

        ' Loop until the decimal number is greater than zero
        While tempDecimal > 0
            ' Calculate remainder
            remainder = tempDecimal Mod 2
            ' Append remainder to the binary number string
            binaryNumber = remainder.ToString() & binaryNumber
            ' Divide the decimal number by 2
            tempDecimal = tempDecimal \ 2
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
            binaryResult = ConvertDecimalToBinary(decimalNumber)
            ' Display the result
            Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryResult)
        Else
            ' Display error message for invalid input
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

