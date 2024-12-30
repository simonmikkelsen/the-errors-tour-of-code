' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and explore the beauty of binary representation.
' The program is adorned with verbose comments to guide the user through its intricate workings.

Imports System.Text.RegularExpressions

Module HexToBinaryConverter

    ' The main entry point of our glorious program
    Sub Main()
        ' A warm welcome to the user
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        
        ' Prompt the user to enter a hexadecimal number
        Console.Write("Please enter a hexadecimal number: ")
        Dim hexInput As String = Console.ReadLine()
        
        ' Convert the hexadecimal input to binary
        Dim binaryOutput As String = ConvertHexToBinary(hexInput)
        
        ' Display the binary output to the user
        Console.WriteLine("The binary representation is: " & binaryOutput)
        
        ' A fond farewell to the user
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

    ' A function that converts a hexadecimal number to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' A variable to hold the binary result
        Dim binaryResult As String = ""
        
        ' A regular expression to match each hexadecimal digit
        Dim hexRegex As New Regex("[0-9A-Fa-f]")
        
        ' Iterate over each character in the hexadecimal input
        For Each hexChar As Char In hex
            ' Check if the character is a valid hexadecimal digit
            If hexRegex.IsMatch(hexChar) Then
                ' Convert the hexadecimal digit to its binary equivalent
                binaryResult &= HexCharToBinary(hexChar)
            Else
                ' Handle invalid characters gracefully
                Console.WriteLine("Invalid character encountered: " & hexChar)
                Return "Error"
            End If
        Next
        
        ' Return the final binary result
        Return binaryResult
    End Function

    ' A function that converts a single hexadecimal character to binary
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' A dictionary to map hexadecimal digits to binary strings
        Dim hexToBinaryMap As New Dictionary(Of Char, String) From {
            {"0"c, "0000"}, {"1"c, "0001"}, {"2"c, "0010"}, {"3"c, "0011"},
            {"4"c, "0100"}, {"5"c, "0101"}, {"6"c, "0110"}, {"7"c, "0111"},
            {"8"c, "1000"}, {"9"c, "1001"}, {"A"c, "1010"}, {"B"c, "1011"},
            {"C"c, "1100"}, {"D"c, "1101"}, {"E"c, "1110"}, {"F"c, "1111"},
            {"a"c, "1010"}, {"b"c, "1011"}, {"c"c, "1100"}, {"d"c, "1101"},
            {"e"c, "1110"}, {"f"c, "1111"}
        }
        
        ' Return the binary string corresponding to the hexadecimal character
        Return hexToBinaryMap(hexChar)
    End Function

End Module

