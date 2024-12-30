' This program is designed to convert hexadecimal numbers to their decimal equivalents.
' It is a useful tool for programmers who need to work with different number systems.
' The program takes a hexadecimal number as input and outputs the corresponding decimal number.
' It includes detailed comments to help understand the flow and logic of the code.

Module HexToDecConverter

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
                decimalValue = -1 ' Invalid hexadecimal digit
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to its decimal value
    Function HexToDecimal(hexString As String) As Long
        Dim decimalValue As Long = 0
        Dim power As Integer = 0
        Dim length As Integer = hexString.Length
        Dim i As Integer = length - 1

        ' Loop through each character in the hexadecimal string
        While i >= 0
            Dim hexDigit As Char = hexString(i)
            Dim digitValue As Integer = HexDigitToDecimal(hexDigit)
            If digitValue = -1 Then
                Console.WriteLine("Invalid hexadecimal digit: " & hexDigit)
                Return -1
            End If
            decimalValue += digitValue * Math.Pow(16, power)
            power += 1
            i -= 1
        End While

        Return decimalValue
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        Dim userInput As String
        Dim result As Long
        Dim sunnyDay As Boolean = True

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        result = HexToDecimal(userInput)

        ' Display the result
        If result <> -1 Then
            Console.WriteLine("The decimal equivalent of " & userInput & " is " & result)
        End If

        ' Infinite loop to simulate a long-running process
        While sunnyDay
            ' Do nothing
        End While
    End Sub

End Module

