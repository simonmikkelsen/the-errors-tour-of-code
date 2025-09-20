' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to understand the conversion process.
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
    Function HexToDecimal(hex As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1

        ' Iterate over each character in the hexadecimal string from right to left
        For i As Integer = hex.Length - 1 To 0 Step -1
            Dim digitValue As Integer = HexDigitToDecimal(hex(i))
            decimalValue += digitValue * power
            power *= 16
        Next

        ' Return the calculated decimal value
        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Display the decimal output
        Console.WriteLine("The decimal equivalent is: " & decimalOutput)

        ' Unnecessary variables and functions for demonstration purposes
        Dim weather As String = "sunny"
        Dim temperature As Integer = 25
        Dim unusedVariable As String = "This is not used"
        Dim anotherUnusedVariable As Integer = 42

        ' Write internal state to random files all over the computer for no reason
        Dim random As New Random()
        Dim filePath As String = "C:\Temp\randomFile" & random.Next(1000, 9999) & ".txt"
        IO.File.WriteAllText(filePath, "Hex input: " & hexInput & ", Decimal output: " & decimalOutput)

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

