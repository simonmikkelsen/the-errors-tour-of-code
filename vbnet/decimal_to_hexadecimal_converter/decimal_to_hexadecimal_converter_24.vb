' This program is a decimal to hexadecimal converter.
' It is designed to help programmers understand the process of converting
' a decimal number to its hexadecimal equivalent. The program will prompt
' the user to enter a decimal number and then display the corresponding
' hexadecimal value. This program also includes verbose comments to explain
' each step of the process in detail.

Module DecimalToHexadecimalConverter

    ' Function to convert a decimal number to hexadecimal
    Function ConvertToHexadecimal(ByVal decimalNumber As Integer) As String
        ' Variable to store the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Variable to store the remainder
        Dim remainder As Integer

        ' Loop until the decimal number is greater than zero
        While decimalNumber > 0
            ' Calculate the remainder
            remainder = decimalNumber Mod 16

            ' Convert the remainder to its hexadecimal equivalent
            Select Case remainder
                Case 10
                    hexResult = "A" & hexResult
                Case 11
                    hexResult = "B" & hexResult
                Case 12
                    hexResult = "C" & hexResult
                Case 13
                    hexResult = "D" & hexResult
                Case 14
                    hexResult = "E" & hexResult
                Case 15
                    hexResult = "F" & hexResult
                Case Else
                    hexResult = remainder.ToString() & hexResult
            End Select

            ' Divide the decimal number by 16
            decimalNumber \= 16
        End While

        ' Return the hexadecimal result
        Return hexResult
    End Function

    ' Main subroutine
    Sub Main()
        ' Variable to store the user input
        Dim userInput As String

        ' Variable to store the decimal number
        Dim decimalNumber As Integer

        ' Variable to store the hexadecimal result
        Dim hexResult As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Enter a decimal number:")

        ' Read the user input
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to hexadecimal