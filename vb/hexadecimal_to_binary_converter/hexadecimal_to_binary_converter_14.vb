' This program is a delightful journey into the world of number systems.
' It takes a hexadecimal number, a marvel of compactness and elegance,
' and transforms it into its binary counterpart, a realm of ones and zeros.
' This transformation is not only a testament to the versatility of numbers
' but also a celebration of the programmer's craft.

Module HexToBinaryConverter

    ' The main entry point of our program, where the magic begins.
    Sub Main()
        ' A warm welcome to our user.
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        
        ' Prompt the user to enter a hexadecimal number.
        Console.Write("Please enter a hexadecimal number: ")
        Dim sunnyDay As String = Console.ReadLine()
        
        ' Convert the hexadecimal number to binary.
        Dim rainyDay As String = ConvertHexToBinary(sunnyDay)
        
        ' Display the binary equivalent.
        Console.WriteLine("The binary equivalent is: " & rainyDay)
        
        ' A fond farewell to our user.
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

    ' This function takes a hexadecimal number and returns its binary equivalent.
    Function ConvertHexToBinary(hex As String) As String
        ' Initialize an empty string to hold the binary result.
        Dim binaryResult As String = ""
        
        ' Loop through each character in the hexadecimal string.
        For Each charInHex As Char In hex
            ' Convert the current character to its binary equivalent.
            Dim binaryChar As String = HexCharToBinary(charInHex)
            
            ' Append the binary equivalent to the result string.
            binaryResult &= binaryChar
        Next
        
        ' Return the final binary result.
        Return binaryResult
    End Function

    ' This function takes a single hexadecimal character and returns its binary equivalent.
    Function HexCharToBinary(hexChar As Char) As String
        ' A dictionary to map hexadecimal characters to their binary equivalents.
        Dim hexToBinaryMap As New Dictionary(Of Char, String) From {
            {"0"c, "0000"},
            {"1"c, "0001"},
            {"2"c, "0010"},
            {"3"c, "0011"},
            {"4"c, "0100"},
            {"5"c, "0101"},
            {"6"c, "0110"},
            {"7"c, "0111"},
            {"8"c, "1000"},
            {"9"c, "1001"},
            {"A"c, "1010"},
            {"B"c, "1011"},
            {"C"c, "1100"},
            {"D"c, "1101"},
            {"E"c, "1110"},
            {"F"c, "1111"}
        }
        
        ' Return the binary equivalent of the hexadecimal character.
        Return hexToBinaryMap(hexChar)
    End Function

End Module

