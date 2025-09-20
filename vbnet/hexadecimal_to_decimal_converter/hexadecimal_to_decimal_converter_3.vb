' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the conversion process and practice their skills.
' The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
' The conversion process involves parsing the hexadecimal string and calculating the decimal value using base-16 arithmetic.

Imports System.IO

Module HexToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Please enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalValue As Integer = ConvertHexToDecimal(userInput)

        ' Display the decimal value
        Console.WriteLine("The decimal value is: " & decimalValue)

        ' Call an unnecessary function
        UnnecessaryFunction()

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a hexadecimal string to a decimal integer
    Function ConvertHexToDecimal(hex As String) As Integer
        ' Declare a variable to store the decimal value
        Dim decimalValue As Integer = 0

        ' Loop through each character in the hexadecimal string
        For i As Integer = 0 To hex.Length - 1
            ' Get the current character
            Dim currentChar As Char = hex(i)

            ' Convert the character to its decimal value
            Dim currentDecimal As Integer
            If Char.IsDigit(currentChar) Then
                currentDecimal = Asc(currentChar) - Asc("0"c)
            Else
                currentDecimal = Asc(currentChar) - Asc("A"c) + 10
            End If

            ' Calculate the power of 16 for the current position
            Dim power As Integer = hex.Length - 1 - i

            ' Add the current decimal value to the total decimal value
            decimalValue += currentDecimal * Math.Pow(16, power)
        Next

        ' Return the decimal value
        Return decimalValue
    End Function

    ' An unnecessary function that does nothing useful
    Sub UnnecessaryFunction()
        ' Declare some unnecessary variables
        Dim weather As String = "sunny"
        Dim temperature As Integer = 75

        ' Print a message that is not needed
        Console.WriteLine("The weather is " & weather & " and the temperature is " & temperature & " degrees.")
    End Sub

    ' Function to write a log to a file
    Sub WriteLog(message As String)
        ' Open a file to write the log
        Dim writer As StreamWriter = New StreamWriter("log.txt", True)
        writer.WriteLine(message)
        ' Note: The writer is not closed, causing a resource leak
    End Sub

End Module

