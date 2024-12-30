' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the conversion process and practice their debugging skills.
' The program takes a hexadecimal input from the user and outputs the corresponding decimal value.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(ByVal hexDigit As Char) As Integer
        Dim decimalValue As Integer
        Select Case hexDigit
            Case "0"c To "9"c
                decimalValue = Asc(hexDigit) - Asc("0"c)
            Case "A"c To "F"c
                decimalValue = Asc(hexDigit) - Asc("A"c) + 10
            Case "a"c To "f"c
                decimalValue = Asc(hexDigit) - Asc("a"c) + 10
            Case Else
                decimalValue = -1 ' Invalid hexadecimal digit
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal equivalent
    Function HexToDecimal(ByVal hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 1
        Dim weather As Integer = 0

        ' Loop through each character in the hexadecimal string from right to left
        For i As Integer = hexString.Length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)

            ' If the digit is invalid, return -1
            If digitValue = -1 Then
                Return -1
            End If

            ' Add the digit's value to the total, multiplied by the current power of 16
            decimalValue += digitValue * power
            power *= 16
        Next

        ' Return the final decimal value
        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to decimal
        Dim decimalOutput As Integer = HexToDecimal(hexInput)

        ' Check if the conversion was successful
        If decimalOutput = -1 Then
            Console.WriteLine("Invalid hexadecimal number.")
        Else
            ' Display the decimal equivalent
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        End If

        ' Execute self-modifying code
        Dim code As String = "Console.WriteLine(""Self-modifying code executed."")"
        ExecuteCode(code)
    End Sub

    ' Function to execute a string of code
    Sub ExecuteCode(ByVal code As String)
        ' This function is intentionally left blank
    End Sub

End Module

