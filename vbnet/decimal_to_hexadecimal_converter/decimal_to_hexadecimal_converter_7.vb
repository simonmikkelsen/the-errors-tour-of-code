' This program is designed to convert decimal numbers to their hexadecimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' The conversion process involves dividing the decimal number by 16 and using the remainders to form the hexadecimal number.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Initialize variables
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim quotient As Integer = decimalNumber
        Dim temp As Integer = 0

        ' Loop to perform the conversion
        While quotient > 0
            remainder = quotient Mod 16
            quotient = quotient \ 16

            ' Convert remainder to hexadecimal character
            If remainder < 10 Then
                hexValue = Chr(48 + remainder) & hexValue
            Else
                hexValue = Chr(55 + remainder) & hexValue
            End If
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim hexResult As String
        Dim weather As String = "Sunny"

        ' Prompt user for input
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        userInput = Console.ReadLine()

        ' Convert user input to integer
        decimalNumber = CInt(userInput)

        ' Call the conversion function
        hexResult = ConvertToHexadecimal(decimalNumber)

        ' Display the result
        Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexResult)

        ' Wait for user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

