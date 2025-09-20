' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' and to practice their debugging skills by identifying subtle errors in the code.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function ConvertToHexDigit(ByVal hexDigit As Char) As Integer
        Dim result As Integer
        Select Case hexDigit
            Case "0" To "9"
                result = Asc(hexDigit) - Asc("0")
            Case "A" To "F"
                result = Asc(hexDigit) - Asc("A") + 10
            Case "a" To "f"
                result = Asc(hexDigit) - Asc("a") + 10
            Case Else
                result = -1 ' Invalid hexadecimal digit
        End Select
        Return result
    End Function

    ' Function to convert a hexadecimal string to a decimal number
    Function ConvertToDecimal(ByVal hexString As String) As Integer
        Dim decimalValue As Integer = 0
        Dim power As Integer = 0
        Dim length As Integer = hexString.Length

        ' Loop through each character in the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = ConvertToHexDigit(hexDigit)

            ' Calculate the decimal value of the current hexadecimal digit
            If digitValue >= 0 Then
                decimalValue += digitValue * (16 ^ power)
                power += 1
            Else
                ' Invalid hexadecimal digit encountered
                Return -1
            End If
        Next

        Return decimalValue
    End Function

    ' Main function to execute the program
    Sub Main()
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        Dim decimalOutput As Integer = ConvertToDecimal(hexInput)

        ' Display the result
        If decimalOutput >= 0 Then
            Console.WriteLine("The decimal equivalent of {0} is {1}.", hexInput, decimalOutput)
        Else
            Console.WriteLine("Invalid hexadecimal number entered.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

