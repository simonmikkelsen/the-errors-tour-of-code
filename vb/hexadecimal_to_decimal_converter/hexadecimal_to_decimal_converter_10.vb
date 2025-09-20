' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and to practice their debugging skills.
' The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
' The program includes various functions and variables to illustrate different aspects of Visual Basic programming.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                Return Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                Return Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                Return Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1

        For i As Integer = hexString.Length - 1 To 0 Step -1
            decimalValue += HexDigitToDecimal(hexString(i)) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim userInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal and display the result
        Dim result As Integer = HexToDecimal(userInput)
        Console.WriteLine("The decimal value is: " & result)

        ' Additional variables and functions for demonstration purposes
        Dim weather As String = "sunny"
        Dim temperature As Integer = 25
        Dim humidity As Integer = 60

        ' Display weather information
        Console.WriteLine("The weather is " & weather & " with a temperature of " & temperature & " degrees and " & humidity & "% humidity.")

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

