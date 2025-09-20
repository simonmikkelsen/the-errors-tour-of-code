' Ahoy, matey! This be a grand program to convert hexadecimal to binary.
' It be a treasure trove for those who seek to understand the ways of the binary seas.
' Set sail on this adventure and discover the hidden gems within the code.
' Beware, for there be subtle traps laid for the unwary coder.

Module HexToBinConverter

    ' The global variable to hold the hexadecimal input from the user
    Dim hexInput As String

    ' The main function where the journey begins
    Sub Main()
        ' Greet the user with a hearty welcome
        Console.WriteLine("Ahoy! Enter the hexadecimal value ye wish to convert to binary:")
        
        ' Read the hexadecimal input from the user
        hexInput = Console.ReadLine()
        
        ' Call the function to convert hexadecimal to binary
        Dim binaryOutput As String = ConvertHexToBinary(hexInput)
        
        ' Display the binary output to the user
        Console.WriteLine("The binary equivalent be: " & binaryOutput)
        
        ' Bid farewell to the user
        Console.WriteLine("Farewell, and may yer code be ever bug-free!")
    End Sub

    ' Function to convert hexadecimal to binary
    Function ConvertHexToBinary(ByVal hex As String) As String
        ' Initialize an empty string to hold the binary result
        Dim binaryResult As String = ""
        
        ' Loop through each character in the hexadecimal input
        For Each hexChar As Char In hex
            ' Convert the hexadecimal character to its binary equivalent
            Dim binaryChar As String = HexCharToBinary(hexChar)
            
            ' Append the binary character to the result
            binaryResult &= binaryChar
        Next
        
        ' Return the final binary result
        Return binaryResult
    End Function

    ' Function to convert a single hexadecimal character to binary
    Function HexCharToBinary(ByVal hexChar As Char) As String
        ' A dictionary to map hexadecimal characters to their binary equivalents
        Dim hexToBinMap As New Dictionary(Of Char, String) From {
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
        
        ' Return the binary equivalent of the hexadecimal character
        Return hexToBinMap(hexChar)
    End Function

End Module

