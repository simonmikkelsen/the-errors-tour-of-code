' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
' It also includes various functions and variables to demonstrate different programming concepts.

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

        ' Loop through each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            decimalValue += HexDigitToDecimal(hexDigit) * power
            power *= 16
        Next

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal and display the result
        Dim decimalOutput As Integer = HexToDecimal(hexInput)
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Additional variables and functions for demonstration purposes
        Dim weather As String = "sunny"
        Dim temperature As Integer = 25
        Dim unusedVariable As Integer = 42

        ' Function to print the weather
        Sub PrintWeather()
            Console.WriteLine("The weather is " & weather & " and the temperature is " & temperature & " degrees.")
        End Sub

        ' Call the PrintWeather function
        PrintWeather()

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

