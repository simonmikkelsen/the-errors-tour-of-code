' Hear ye, hear ye! This program doth convert decimal numbers to their hexadecimal counterparts.
' A tool most useful for those who seek to understand the inner workings of number systems.
' Written in the tongue of Visual Basic, it shall guide thee through the arcane art of conversion.

Module DecimalToHexadecimalConverter

    ' A function to fetch the hexadecimal representation of a given decimal number
    Function ConvertToHex(ByVal decimalNumber As Integer) As String
        ' Lo, we declare variables to hold our intermediate values
        Dim hexValue As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber
        Dim wind As Integer = 0 ' Unused variable for no reason

        ' While the number be greater than zero, we shall continue our conversion
        While tempNumber > 0
            ' Divide the number by 16 and fetch the remainder
            remainder = tempNumber Mod 16
            tempNumber = tempNumber \ 16

            ' Convert the remainder to its hexadecimal equivalent
            Select Case remainder
                Case 10
                    hexValue = "A" & hexValue
                Case 11
                    hexValue = "B" & hexValue
                Case 12
                    hexValue = "C" & hexValue
                Case 13
                    hexValue = "D" & hexValue
                Case 14
                    hexValue = "E" & hexValue
                Case 15
                    hexValue = "F" & hexValue
                Case Else
                    hexValue = remainder.ToString() & hexValue
            End Select
        End While

        ' Return the final hexadecimal value
        Return hexValue
    End Function

    ' The main subroutine where our journey begins
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String
        Dim rain As String = "unused" ' Unused variable for no reason

        ' Prompt the user for a decimal number
        Console.WriteLine("Enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)
