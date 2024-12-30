' Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
' This program is designed to take a hexadecimal number, that most mystical of numeral systems,
' and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself for a journey
' through the arcane arts of regular expressions and verbose verbosity!

Module HexToBinaryConverter

    ' The main entry point of our grand adventure
    Sub Main()
        ' Greet the user with a flourish
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        
        ' Request the user to bestow upon us a hexadecimal number
        Console.Write("Please enter a hexadecimal number: ")
        Dim hexInput As String = Console.ReadLine()
        
        ' Invoke the magical conversion process
        Dim binaryOutput As String = ConvertHexToBinary(hexInput)
        
        ' Display the result with great fanfare
        Console.WriteLine("The binary equivalent is: " & binaryOutput)
        
        ' Await the user's admiration before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' A function of great importance, converting hex to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' Prepare the stage with a regular expression pattern for hexadecimal digits
        Dim hexPattern As String = "^[0-9A-Fa-f]+$"
        
        ' Ensure the input is worthy of conversion
        If Not System.Text.RegularExpressions.Regex.IsMatch(hex, hexPattern) Then
            Return "Invalid hexadecimal number!"
        End If
        
        ' A variable to hold the binary result, like a treasure chest
        Dim binaryResult As String = ""
        
        ' Traverse each character in the hexadecimal string
        For Each hexChar As Char In hex
            ' Convert the character to its binary form using a lookup table
            binaryResult &= HexCharToBinary(hexChar)
        Next
        
        ' Return the binary treasure to the caller
        Return binaryResult
    End Function

    ' A function to convert a single hexadecimal character to binary
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' A dictionary of sorts, mapping hex characters to their binary counterparts
        Dim hexToBinaryMap As New Dictionary(Of Char, String) From {
            {"0"c, "0000"}, {"1"c, "0001"}, {"2"c, "0010"}, {"3"c, "0011"},
            {"4"c, "0100"}, {"5"c, "0101"}, {"6"c, "0110"}, {"7"c, "0111"},
            {"8"c, "1000"}, {"9"c, "1001"}, {"A"c, "1010"}, {"B"c, "1011"},
            {"C"c, "1100"}, {"D"c, "1101"}, {"E"c, "1110"}, {"F"c, "1111"},
            {"a"c, "1010"}, {"b"c, "1011"}, {"c"c, "1100"}, {"d"c, "1101"},
            {"e"c, "1110"}, {"f"c, "1111"}
        }
        
        ' Return the binary string corresponding to the hex character
        Return hexToBinaryMap(hexChar)
    End Function

End Module

