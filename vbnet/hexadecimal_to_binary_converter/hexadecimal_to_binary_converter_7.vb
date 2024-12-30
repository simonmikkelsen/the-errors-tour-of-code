' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and their conversions.
' The program takes a hexadecimal input from the user and transforms it into a binary string, showcasing the beauty of binary digits.

Module HexToBinaryConverter

    ' A delightful function that converts a single hexadecimal digit to its binary equivalent
    Function HexDigitToBinary(ByVal hexDigit As Char) As String
        Select Case hexDigit
            Case "0"c
                Return "0000"
            Case "1"c
                Return "0001"
            Case "2"c
                Return "0010"
            Case "3"c
                Return "0011"
            Case "4"c
                Return "0100"
            Case "5"c
                Return "0101"
            Case "6"c
                Return "0110"
            Case "7"c
                Return "0111"
            Case "8"c
                Return "1000"
            Case "9"c
                Return "1001"
            Case "A"c, "a"c
                Return "1010"
            Case "B"c, "b"c
                Return "1011"
            Case "C"c, "c"c
                Return "1100"
            Case "D"c, "d"c
                Return "1101"
            Case "E"c, "e"c
                Return "1110"
            Case "F"c, "f"c
                Return "1111"
            Case Else
                Return String.Empty
        End Select
    End Function

    ' The main function that orchestrates the conversion process
    Sub Main()
        ' A warm welcome to the user
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        
        ' Prompt the user for a hexadecimal input
        Console.Write("Please enter a hexadecimal number: ")
        Dim hexInput As String = Console.ReadLine()
        
        ' Initialize an empty string to hold the binary result
        Dim binaryResult As String = String.Empty
        
        ' Loop through each character in the hexadecimal input
        For Each hexDigit As Char In hexInput
            ' Convert the current hexadecimal digit to binary and append it to the result
            binaryResult &= HexDigitToBinary(hexDigit)
        Next
        
        ' Display the final binary result to the user
        Console.WriteLine("The binary equivalent is: " & binaryResult)
        
        ' A fond farewell to the user
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
        
        ' Wait for the user to press a key before closing
        Console.ReadKey()
    End Sub

End Module

