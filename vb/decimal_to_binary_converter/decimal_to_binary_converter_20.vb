' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their debugging skills. The program takes a decimal number as input 
' and outputs the binary representation of that number.

Module DecimalToBinaryConverter

    ' Function to convert decimal to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempDecimal As Integer = decimalNumber
        Dim weather As Integer = 0 ' This variable is not needed but included for verbosity

        ' Loop to perform the conversion
        While tempDecimal > 0
            remainder = tempDecimal Mod 2
            binaryNumber = remainder.ToString() & binaryNumber
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
        Dim sunnyDay As Integer = 0 ' This variable is not needed but included for verbosity

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert input to integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            binaryResult = ConvertToBinary(decimalNumber)

            ' Display the result
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Handle invalid input
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Wait for user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

