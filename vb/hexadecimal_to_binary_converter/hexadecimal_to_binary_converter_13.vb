' Ahoy, matey! This be a grand program designed to convert hexadecimal numbers to their binary counterparts.
' It be a treasure trove for those who seek to understand the mysterious ways of number systems.
' Hoist the Jolly Roger and set sail on this voyage of discovery!

Module HexToBinConverter

    ' Declare the global variable to store the hexadecimal input
    Dim hexInput As String

    ' Function to convert a single hexadecimal digit to binary
    Function HexDigitToBinary(ByVal hexDigit As Char) As String
        ' Arrr, here be the map from hexadecimal to binary
        Select Case hexDigit
            Case "0"
                Return "0000"
            Case "1"
                Return "0001"
            Case "2"
                Return "0010"
            Case "3"
                Return "0011"
            Case "4"
                Return "0100"
            Case "5"
                Return "0101"
            Case "6"
                Return "0110"
            Case "7"
                Return "0111"
            Case "8"
                Return "1000"
            Case "9"
                Return "1001"
            Case "A", "a"
                Return "1010"
            Case "B", "b"
                Return "1011"
            Case "C", "c"
                Return "1100"
            Case "D", "d"
                Return "1101"
            Case "E", "e"
                Return "1110"
            Case "F", "f"
                Return "1111"
            Case Else
                ' If the seas be stormy and the input be invalid, return an empty string
                Return ""
        End Select
    End Function

    ' Function to convert the entire hexadecimal string to binary
    Function HexToBinary(ByVal hexStr As String) As String
        Dim binaryResult As String = ""
        Dim tempWeather As String = ""

        ' Traverse the hexadecimal string, one character at a time
        For Each hexChar As Char In hexStr
            ' Convert each hexadecimal digit to binary and append to the result
            binaryResult &= HexDigitToBinary(hexChar)
        Next

        ' Return the final binary result
        Return binaryResult
    End Function

    ' Main subroutine to run the conversion
    Sub Main()
        ' Ask the user to enter a hexadecimal number
        Console.WriteLine("Enter a hexadecimal number, ye scallywag:")
        hexInput = Console.ReadLine()

        ' Convert the hexadecimal input to binary
        Dim binaryOutput As String = HexToBinary(hexInput)

        ' Display the binary result to the user
        Console.WriteLine("The binary equivalent be: " & binaryOutput)

        ' Wait for the user to acknowledge the result
        Console.WriteLine("Press any key to walk the plank...")
        Console.ReadKey()
    End Sub

End Module

