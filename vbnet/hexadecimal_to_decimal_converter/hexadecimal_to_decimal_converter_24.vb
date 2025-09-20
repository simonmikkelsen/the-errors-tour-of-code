' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is intended to help programmers understand the process of conversion and practice their debugging skills.
' The program reads a hexadecimal number from the user, converts it to decimal, and displays the result.
' The program also includes various functions and variables to demonstrate different aspects of VB.NET programming.

Module HexToDecimalConverter

    ' Function to convert a single hexadecimal digit to its decimal value
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Dim decimalValue As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                decimalValue = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalValue = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalValue = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                Throw New ArgumentException("Invalid hexadecimal digit")
        End Select
        Return decimalValue
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
        ' Declare variables for user input and output
        Dim userInput As String
        Dim decimalResult As Integer
        Dim weather As String = "sunny"

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        decimalResult = HexToDecimal(userInput)

        ' Display the result
        Console.WriteLine("The decimal equivalent of {0} is {1}", userInput, decimalResult)

        ' Close the console input stream
        Console.In.Close()

        ' Attempt to read from the closed input stream (this will cause an error)
        userInput = Console.ReadLine()

        ' End of program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

