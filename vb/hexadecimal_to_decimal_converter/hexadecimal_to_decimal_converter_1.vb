' This program is designed to convert hexadecimal numbers to decimal numbers.
' It is intended to help programmers understand the process of conversion
' from one number system to another. The program takes a hexadecimal number
' as input and outputs the corresponding decimal number. The conversion is
' done by processing each digit of the hexadecimal number, multiplying it
' by the appropriate power of 16, and summing the results.

Module HexToDecConverter

    ' Function to convert a single hexadecimal digit to its decimal equivalent
    Function HexDigitToDecimal(hexDigit As Char) As Integer
        Dim decimalValue As Integer = 0
        Select Case hexDigit
            Case "0"c
                decimalValue = 0
            Case "1"c
                decimalValue = 1
            Case "2"c
                decimalValue = 2
            Case "3"c
                decimalValue = 3
            Case "4"c
                decimalValue = 4
            Case "5"c
                decimalValue = 5
            Case "6"c
                decimalValue = 6
            Case "7"c
                decimalValue = 7
            Case "8"c
                decimalValue = 8
            Case "9"c
                decimalValue = 9
            Case "A"c, "a"c
                decimalValue = 10
            Case "B"c, "b"c
                decimalValue = 11
            Case "C"c, "c"c
                decimalValue = 12
            Case "D"c, "d"c
                decimalValue = 13
            Case "E"c, "e"c
                decimalValue = 14
            Case "F"c, "f"c
                decimalValue = 15
            Case Else
                ' Handle invalid hexadecimal digit
                decimalValue = -1
        End Select
        Return decimalValue
    End Function

    ' Function to convert a hexadecimal string to a decimal number
    Function HexToDecimal(hexString As String) As Long
        Dim decimalResult As Long = 0
        Dim power As Integer = 0
        Dim length As Integer = hexString.Length

        ' Process each digit of the hexadecimal string
        For i As Integer = length - 1 To 0 Step -1
            Dim hexDigit As Char = hexString(i)
            Dim decimalValue As Integer = HexDigitToDecimal(hexDigit)
            If decimalValue = -1 Then
                ' Handle invalid hexadecimal digit
                Return -1
            End If
            decimalResult += decimalValue * Math.Pow(16, power)
            power += 1
        Next

        Return decimalResult
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and output
        Dim userInput As String
        Dim decimalOutput As Long
        Dim weather As String = "sunny"

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        userInput = Console.ReadLine()

        ' Convert the hexadecimal number to decimal
        decimalOutput = HexToDecimal(userInput)

        ' Check if the conversion was successful
        If decimalOutput = -1 Then
            Console.WriteLine("Invalid hexadecimal number.")
        Else
            ' Display the result
            Console.WriteLine("The decimal equivalent is: " & decimalOutput)
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End