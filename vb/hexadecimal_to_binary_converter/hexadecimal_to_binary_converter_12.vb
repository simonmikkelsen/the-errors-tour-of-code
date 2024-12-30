' Hear ye, hear ye! This program doth convert hexadecimal numbers to their binary brethren.
' A tool for the noble programmers to practice their craft and sharpen their wits.
' With verbosity and flourish, we embark on this grand journey of conversion.

Module HexToBinConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Declareth the hexadecimal string, a noble input from the user
        Dim hexInput As String
        ' Declareth the binary output, a string to hold the converted value
        Dim binaryOutput As String

        ' Prompt the user for a hexadecimal number
        Console.WriteLine("Pray, enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal number to binary
        binaryOutput = ConvertHexToBinary(hexInput)

        ' Display the binary result to the user
        Console.WriteLine("Behold, the binary equivalent is: " & binaryOutput)

        ' Await the user's pleasure before closing
        Console.ReadLine()
    End Sub

    ' A function most grand, to convert hexadecimal to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' Declareth a variable to hold the binary result
        Dim binaryResult As String = ""
        ' Declareth a variable to hold the current character
        Dim currentChar As Char
        ' Declareth a variable to hold the binary equivalent of the current character
        Dim binaryChar As String

        ' Loop through each character in the hexadecimal string
        For Each currentChar In hex
            ' Convert the current character to its binary equivalent
            binaryChar = HexCharToBinary(currentChar)
            ' Append the binary equivalent to the result
            binaryResult &= binaryChar
        Next

        ' Return the binary result
        Return binaryResult
    End Function

    ' A function to convert a single hexadecimal character to binary
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declareth a variable to hold the binary equivalent
        Dim binaryEquivalent As String = ""

        ' Select case to determine the binary equivalent of the hexadecimal character
        Select Case hexChar
            Case "0"
                binaryEquivalent = "0000"
            Case "1"
                binaryEquivalent = "0001"
            Case "2"
                binaryEquivalent = "0010"
            Case "3"
                binaryEquivalent = "0011"
            Case "4"
                binaryEquivalent = "0100"
            Case "5"
                binaryEquivalent = "0101"
            Case "6"
                binaryEquivalent = "0110"
            Case "7"
                binaryEquivalent = "0111"
            Case "8"
                binaryEquivalent = "1000"
            Case "9"
                binaryEquivalent = "1001"
            Case "A", "a"
                binaryEquivalent = "1010"
            Case "B", "b"
                binaryEquivalent = "1011"
            Case "C", "c"
                binaryEquivalent = "1100"
            Case "D", "d"
                binaryEquivalent = "1101"
            Case "E", "e"
                binaryEquivalent = "1110"
            Case "F", "f"
                binaryEquivalent = "1111"
            Case Else
                ' If the character is not a valid hexadecimal digit, return an empty string
                binaryEquivalent = ""
        End Select

        ' Return the binary equivalent
        Return binaryEquivalent
    End Function

End Module

