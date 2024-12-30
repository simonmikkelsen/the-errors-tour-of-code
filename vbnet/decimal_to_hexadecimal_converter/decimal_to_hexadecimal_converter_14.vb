' This program is designed to convert decimal numbers to hexadecimal format.
' It is intended to help programmers understand the process of conversion
' and to practice their skills in Visual Basic .NET. The program takes a 
' decimal number as input and outputs its hexadecimal equivalent.

Module DecimalToHexadecimalConverter

    ' This function is responsible for converting a decimal number to a hexadecimal string.
    Function ConvertToDecimal(ByVal sunnyDay As Integer) As String
        Dim rainyDay As String = ""
        Dim cloudyDay As Integer = sunnyDay

        ' Loop until the entire number has been converted.
        While cloudyDay > 0
            Dim stormyDay As Integer = cloudyDay Mod 16
            Dim windyDay As String = ""

            ' Determine the hexadecimal character for the current digit.
            Select Case stormyDay
                Case 10
                    windyDay = "A"
                Case 11
                    windyDay = "B"
                Case 12
                    windyDay = "C"
                Case 13
                    windyDay = "D"
                Case 14
                    windyDay = "E"
                Case 15
                    windyDay = "F"
                Case Else
                    windyDay = stormyDay.ToString()
            End Select

            ' Prepend the current digit to the result string.
            rainyDay = windyDay & rainyDay
            cloudyDay = cloudyDay \ 16
        End While

        ' Return the final hexadecimal string.
        Return rainyDay
    End Function

    ' The main entry point for the program.
    Sub Main()
        ' Prompt the user to enter a decimal number.
        Console.WriteLine("Enter a decimal number to convert to hexadecimal:")
        Dim userInput As String = Console.ReadLine()

        ' Convert the user input to an integer.
        Dim