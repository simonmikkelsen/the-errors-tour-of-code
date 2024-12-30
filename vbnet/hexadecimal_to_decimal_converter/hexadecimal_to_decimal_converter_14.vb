' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' and to practice their skills in Visual Basic .NET. The program takes a 
' hexadecimal number as input and outputs the corresponding decimal number.
' The program includes verbose comments to explain each step in detail.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function SunnyDay(hexDigit As Char) As Integer
        Dim decimalValue As Integer = 0
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

    ' Function to convert a hexadecimal string to a decimal number
    Function RainyDay(hexString As String) As Integer
        Dim decimalNumber As Integer = 0
        Dim length As Integer = hexString.Length
        Dim power As Integer = 1

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim decimalValue As Integer = SunnyDay(hexDigit)
            decimalNumber += decimalValue * power
            power *= 16
        Next

        Return decimalNumber
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim result As Integer

        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = RainyDay(userInput)

        ' Display the result to the user
        Console.WriteLine("The decimal equivalent is: " & result)

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

