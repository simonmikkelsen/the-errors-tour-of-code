' This program is a delightful journey into the world of number systems.
' Specifically, it converts decimal numbers into their hexadecimal counterparts.
' Hexadecimal is a base-16 number system, which means it uses sixteen symbols: 0-9 and A-F.
' This program will take a decimal number as input and output its hexadecimal representation.
' Enjoy the ride through the magical land of numbers!

Module DecimalToHexadecimalConverter

    ' This function converts a decimal number to a hexadecimal string.
    Function ConvertDecimalToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Initialize an empty string to store the hexadecimal result.
        Dim hexResult As String = String.Empty

        ' A variable to store the remainder of the division.
        Dim remainder As Integer

        ' A variable to store the current number being processed.
        Dim currentNumber As Integer = decimalNumber

        ' A loop to perform the conversion.
        Do While currentNumber > 0
            ' Calculate the remainder when the current number is divided by 16.
            remainder = currentNumber Mod 16

            ' Convert the remainder to its hexadecimal equivalent.
            If remainder < 10 Then
                hexResult = Chr(48 + remainder) & hexResult
            Else
                hexResult = Chr(55 + remainder) & hexResult
            End If

            ' Update the current number by dividing it by 16.
            currentNumber = currentNumber \ 16
        Loop

        ' Return the final hexadecimal result.
        Return hexResult
    End Function

    ' The main entry point of the program.
    Sub Main()
        ' A variable to store the user's input.
        Dim userInput As String

        ' A variable to store the decimal number.
        Dim decimalNumber As Integer

        ' A variable to store the hexadecimal result.
        Dim hexResult As String

        ' Prompt the user for input.