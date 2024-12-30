' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
' The program takes a hexadecimal number, processes it through a series of intricate steps, and produces a binary number.
' Prepare yourself for a journey through the realms of Visual Basic, where every line of code is a brushstroke on the canvas of logic.

Module HexToBinaryConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Declare a variable to hold the hexadecimal input
        Dim hexInput As String
        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Declare a variable to hold the binary output
        Dim binaryOutput As String
        ' Call the function to convert hexadecimal to binary
        binaryOutput = ConvertHexToBinary(hexInput)

        ' Display the binary output to the user
        Console.WriteLine("The binary equivalent is: " & binaryOutput)
    End Sub

    ' A function that converts a hexadecimal number to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' Declare a variable to hold the binary result
        Dim binaryResult As String = ""
        ' Declare a variable to hold the intermediate decimal value
        Dim decimalValue As Integer = 0

        ' Loop through each character in the hexadecimal string
        For Each hexChar As Char In hex
            ' Convert the hexadecimal character to its decimal equivalent
            decimalValue = HexCharToDecimal(hexChar)
            ' Convert the decimal value to binary and append it to the result
            binaryResult &= DecimalToBinary(decimalValue)
        Next

        ' Return the final binary result
        Return binaryResult
    End Function

    ' A function that converts a single hexadecimal character to its decimal equivalent
    Function HexCharToDecimal(ByVal hexChar As Char) As Integer
        ' Declare a variable to hold the decimal value
        Dim decimalValue As Integer

        ' Use a select case statement to determine the decimal value of the hexadecimal character
        Select Case hexChar
            Case "0"
                decimalValue = 0
            Case "1"
                decimalValue = 1
            Case "2"
                decimalValue = 2
            Case "3"
                decimalValue = 3
            Case "4"
                decimalValue = 4
            Case "5"
                decimalValue = 5
            Case "6"
                decimalValue = 6
            Case "7"
                decimalValue = 7
            Case "8"
                decimalValue = 8
            Case "9"
                decimalValue = 9
            Case "A", "a"
                decimalValue = 10
            Case "B", "b"
                decimalValue = 11
            Case "C", "c"
                decimalValue = 12
            Case "D", "d"
                decimalValue = 13
            Case "E", "e"
                decimalValue = 14
            Case "F", "f"
                decimalValue = 15
            Case Else
                ' If the character is not a valid hexadecimal character, set the decimal value to 0
                decimalValue = 0
        End Select

        ' Return the decimal value
        Return decimalValue
    End Function

    ' A function that converts a decimal number to binary
    Function DecimalToBinary(ByVal decimalValue As Integer) As String
        ' Declare a variable to hold the binary result
        Dim binaryResult As String = ""

        ' Use a loop to convert the decimal value to binary
        While decimalValue > 0
            ' Append the remainder of the division by 2 to the binary result
            binaryResult = (decimalValue Mod 2).ToString() & binaryResult
            ' Divide the decimal value by 2
            decimalValue \= 2
        End While

        ' If the binary result is empty, set it to "0"
        If binaryResult = "" Then
            binaryResult = "0"
        End If

        ' Return the binary result
        Return binaryResult
    End Function

End Module

