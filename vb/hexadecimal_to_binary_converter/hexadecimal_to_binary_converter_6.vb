' This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
' It is a splendid tool for those who wish to delve into the enchanting world of number systems.
' The program takes a hexadecimal input and transforms it into a binary output, showcasing the beauty of binary digits.
' Prepare to be amazed by the elegance and grace of this conversion process.

Module HexToBinaryConverter

    ' The main entry point of our delightful program
    Sub Main()
        ' A warm welcome to our users
        Console.WriteLine("Welcome to the Hexadecimal to Binary Converter!")
        
        ' Prompt the user for a hexadecimal input
        Console.Write("Please enter a hexadecimal number: ")
        Dim hexInput As String = Console.ReadLine()

        ' Convert the hexadecimal input to binary
        Dim binaryOutput As String = HexToBinary(hexInput)

        ' Display the binary output to our esteemed user
        Console.WriteLine("The binary equivalent is: " & binaryOutput)

        ' A fond farewell to our users
        Console.WriteLine("Thank you for using the Hexadecimal to Binary Converter!")
    End Sub

    ' A function that performs the magical conversion from hexadecimal to binary
    Function HexToBinary(ByVal hex As String) As String
        ' A variable to hold the binary result
        Dim binaryResult As String = ""

        ' A loop to process each character in the hexadecimal input
        For Each hexChar As Char In hex
            ' Convert the current hexadecimal character to its binary equivalent
            Dim binaryChar As String = ConvertHexCharToBinary(hexChar)

            ' Append the binary equivalent to the result
            binaryResult &= binaryChar
        Next

        ' Return the final binary result
        Return binaryResult
    End Function

    ' A function that converts a single hexadecimal character to its binary equivalent
    Function ConvertHexCharToBinary(ByVal hexChar As Char) As String
        ' A variable to hold the binary equivalent
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
                ' Handle invalid hexadecimal characters
                binaryEquivalent = "????"
        End Select

        ' Return the binary equivalent
        Return binaryEquivalent
    End Function

End Module

