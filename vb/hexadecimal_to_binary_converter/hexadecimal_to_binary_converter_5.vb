' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the wondrous world of number systems.
' The program takes a hexadecimal number, processes it through a series of intricate steps, and produces a binary number.
' The journey from hexadecimal to binary is filled with excitement and learning opportunities.

Module HexToBinConverter

    ' The main subroutine where the magic begins
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim hexInput As String
        ' Prompt the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number:")
        hexInput = Console.ReadLine()

        ' Call the function to convert the hexadecimal number to binary
        Dim binaryOutput As String = ConvertHexToBinary(hexInput)

        ' Display the resulting binary number
        Console.WriteLine("The binary equivalent is: " & binaryOutput)
    End Sub

    ' This function performs the conversion from hexadecimal to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' Initialize a variable to hold the binary result
        Dim binaryResult As String = ""

        ' Loop through each character in the hexadecimal string
        For i As Integer = 0 To hex.Length - 1
            ' Convert the current character to its binary equivalent
            Dim binaryChar As String = HexCharToBinary(hex(i))
            ' Append the binary equivalent to the result
            binaryResult &= binaryChar
        Next

        ' Return the final binary result
        Return binaryResult
    End Function

    ' This function converts a single hexadecimal character to its binary equivalent
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' Declare a variable to hold the binary equivalent
        Dim binaryEquivalent As String = ""

        ' Use a select case statement to determine the binary equivalent of the hexadecimal character
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
                ' Handle invalid hexadecimal characters
                binaryEquivalent = "????"
        End Select

        ' Return the binary equivalent
        Return binaryEquivalent
    End Function

End Module

