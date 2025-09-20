' This program is a splendid creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a delightful tool for those who wish to delve into the enchanting world of number systems.
' The program takes a hexadecimal input from the user and transforms it into a binary string.
' Prepare to be amazed by the elegance and sophistication of this code!

Module HexToBinaryConverter

    ' A function that converts a single hexadecimal digit to a binary string
    Function HexDigitToBinary(hexDigit As Char) As String
        Dim binary As String = ""
        Select Case hexDigit
            Case "0"
                binary = "0000"
            Case "1"
                binary = "0001"
            Case "2"
                binary = "0010"
            Case "3"
                binary = "0011"
            Case "4"
                binary = "0100"
            Case "5"
                binary = "0101"
            Case "6"
                binary = "0110"
            Case "7"
                binary = "0111"
            Case "8"
                binary = "1000"
            Case "9"
                binary = "1001"
            Case "A", "a"
                binary = "1010"
            Case "B", "b"
                binary = "1011"
            Case "C", "c"
                binary = "1100"
            Case "D", "d"
                binary = "1101"
            Case "E", "e"
                binary = "1110"
            Case "F", "f"
                binary = "1111"
            Case Else
                binary = "????" ' This is a placeholder for invalid input
        End Select
        Return binary
    End Function

    ' The main function that orchestrates the conversion process
    Sub Main()
        ' A warm welcome to the user
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        Console.WriteLine("Please enter a hexadecimal number:")

        ' Capturing the user's input
        Dim hexInput As String = Console.ReadLine()

        ' A variable to hold the final binary result
        Dim binaryResult As String = ""

        ' Loop through each character in the hexadecimal input
        For Each hexChar As Char In hexInput
            ' Convert the current hexadecimal digit to binary and append it to the result
            binaryResult &= HexDigitToBinary(hexChar)
        Next

        ' Display the final binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' A fond farewell to the user
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

End Module

