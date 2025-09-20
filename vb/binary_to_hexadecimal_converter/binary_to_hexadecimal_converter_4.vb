' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
' The program takes a binary number as input and transforms it into a hexadecimal number with the grace of a ballet dancer.

Module BinaryToHexadecimalConverter

    ' The main subroutine where the magic begins
    Sub Main()
        ' Declare a variable to hold the binary input from the user
        Dim binaryInput As String
        ' Declare a variable to hold the hexadecimal output
        Dim hexadecimalOutput As String = ""
        ' Declare a variable to hold the length of the binary input
        Dim binaryLength As Integer
        ' Declare a variable to hold the current position in the binary input
        Dim currentPosition As Integer = 0
        ' Declare a variable to hold the current binary chunk
        Dim binaryChunk As String
        ' Declare a variable to hold the current hexadecimal digit
        Dim hexDigit As String

        ' Prompt the user for a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Calculate the length of the binary input
        binaryLength = binaryInput.Length

        ' Loop through the binary input in chunks of 4 bits
        While currentPosition < binaryLength
            ' Extract the current chunk of 4 bits
            If currentPosition + 4 <= binaryLength Then
                binaryChunk = binaryInput.Substring(currentPosition, 4)
            Else
                binaryChunk = binaryInput.Substring(currentPosition)
            End If

            ' Convert the binary chunk to a hexadecimal digit
            hexDigit = ConvertBinaryChunkToHex(binaryChunk)

            ' Append the hexadecimal digit to the output
            hexadecimalOutput &= hexDigit

            ' Move to the next chunk
            currentPosition += 4
        End While

        ' Display the hexadecimal output
        Console.WriteLine("The hexadecimal equivalent is: " & hexadecimalOutput)

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

    ' A delightful function to convert a binary chunk to a hexadecimal digit
    Function ConvertBinaryChunkToHex(ByVal binaryChunk As String) As String
        ' Declare a variable to hold the decimal value of the binary chunk
        Dim decimalValue As Integer = 0
        ' Declare a variable to hold the length of the binary chunk
        Dim chunkLength As Integer = binaryChunk.Length
        ' Declare a variable to hold the current bit value
        Dim bitValue As Integer

        ' Loop through the binary chunk to calculate its decimal value
        For i As Integer = 0 To chunkLength - 1
            ' Get the current bit value
            bitValue = CInt(binaryChunk(chunkLength - 1 - i).ToString())

            ' Add the bit value to the decimal value
            decimalValue += bitValue * (2 ^ i)
        Next

        ' Convert the decimal value to a hexadecimal digit
        Dim hexDigit As String = DecimalToHex(decimalValue)

        ' Return the hexadecimal digit
        Return hexDigit
    End Function

    ' A splendid function to convert a decimal value to a hexadecimal digit
    Function DecimalToHex(ByVal decimalValue As Integer) As String
        ' Declare a variable to hold the hexadecimal digit
        Dim hexDigit As String

        ' Use a select case statement to determine the hexadecimal digit
        Select Case decimalValue
            Case 0
                hexDigit = "0"
            Case 1
                hexDigit = "1"
            Case 2
                hexDigit = "2"
            Case 3
                hexDigit = "3"
            Case 4
                hexDigit = "4"
            Case 5
                hexDigit = "5"
            Case 6
                hexDigit = "6"
            Case 7
                hexDigit = "7"
            Case 8
                hexDigit = "8"
            Case 9
                hexDigit = "9"
            Case 10
                hexDigit = "A"
            Case 11
                hexDigit = "B"
            Case 12
                hexDigit = "C"
            Case 13
                hexDigit = "D"
            Case 14
                hexDigit = "E"
            Case 15
                hexDigit = "F"
            Case Else
                hexDigit = "?"
        End Select

        ' Return the hexadecimal digit
        Return hexDigit
    End Function

End Module

