' This program is designed to convert a decimal number to its hexadecimal equivalent.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program takes a decimal number as input and outputs the corresponding hexadecimal value.
' The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
' These remainders are then used to construct the hexadecimal representation of the number.

Module DecimalToHexadecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the decimal number input by the user
        Dim decimalNumber As Integer
        ' Declare a variable to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        ' Read the user input and convert it to an integer
        decimalNumber = Convert.ToInt32(Console.ReadLine())

        ' Call the function to convert the decimal number to hexadecimal
        hexResult = ConvertDecimalToHex(decimalNumber)

        ' Display the hexadecimal result to the user
        Console.WriteLine("The hexadecimal equivalent is: " & hexResult)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to convert a decimal number to its hexadecimal equivalent
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the hexadecimal result
        Dim hexResult As String = String.Empty
        ' Declare a variable to store the remainder of the division
        Dim remainder As Integer
        ' Declare an array to store the hexadecimal digits
        Dim hexDigits() As Char = {"0"c, "1"c, "2"c, "3"c, "4"c, "5"c, "6"c, "7"c, "8"c, "9"c, "A"c, "B"c, "C"c, "D"c, "E"c, "F"c}

        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Calculate the remainder of the division by 16
            remainder = decimalNumber Mod 16
            ' Prepend the corresponding hexadecimal digit to the result
            hexResult = hexDigits(remainder) & hexResult
            ' Divide the decimal number by 16
            decimalNumber = decimalNumber \ 16
        End While

        ' Return the hexadecimal result
        Return hexResult
    End Function

End Module

