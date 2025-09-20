' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and revel in the beauty of binary.
' The program takes a hexadecimal input from the user and transforms it into a binary string, displaying the result with grandeur.

Module HexToBinaryConverter

    ' A function that converts a single hexadecimal digit to its binary equivalent.
    Function HexDigitToBinary(ByVal hexDigit As Char) As String
        Dim binaryValue As String = ""
        Select Case hexDigit
            Case "0"
                binaryValue = "0000"
            Case "1"
                binaryValue = "0001"
            Case "2"
                binaryValue = "0010"
            Case "3"
                binaryValue = "0011"
            Case "4"
                binaryValue = "0100"
            Case "5"
                binaryValue = "0101"
            Case "6"
                binaryValue = "0110"
            Case "7"
                binaryValue = "0111"
            Case "8"
                binaryValue = "1000"
            Case "9"
                binaryValue = "1001"
            Case "A", "a"
                binaryValue = "1010"
            Case "B", "b"
                binaryValue = "1011"
            Case "C", "c"
                binaryValue = "1100"
            Case "D", "d"
                binaryValue = "1101"
            Case "E", "e"
                binaryValue = "1110"
            Case "F", "f"
                binaryValue = "1111"
            Case Else
                binaryValue = "????"
        End Select
        Return binaryValue
    End Function

    ' The main function that orchestrates the conversion process.
    Sub Main()
        ' A warm welcome to the user.
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        Console.WriteLine("Please enter a hexadecimal number:")

        ' Capturing the user's input.
        Dim hexInput As String = Console.ReadLine()

        ' A variable to store the final binary result.
        Dim binaryResult As String = ""

        ' Loop through each character in the hexadecimal input.
        For Each hexChar As Char In hexInput
            ' Convert the current hexadecimal digit to binary and append it to the result.
            binaryResult &= HexDigitToBinary(hexChar)
        Next

        ' Display the grand binary result.
        Console.WriteLine("The binary equivalent is: " & binaryResult)

        ' A fond farewell to the user.
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

End Module

