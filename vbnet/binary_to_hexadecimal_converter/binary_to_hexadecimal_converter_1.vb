' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
' The program takes a binary number, processes it through a series of intricate steps, and finally reveals the hexadecimal equivalent.
' Prepare to be amazed by the sheer elegance and verbosity of this code!

Module BinaryToHexadecimalConverter

    Sub Main()
        ' Declare a variable to hold the binary input from the user
        Dim binaryInput As String
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        binaryInput = Console.ReadLine()

        ' Declare a variable to hold the length of the binary input
        Dim lengthOfBinary As Integer = binaryInput.Length
        ' Declare a variable to hold the hexadecimal output
        Dim hexadecimalOutput As String = ""

        ' Declare a variable to hold the current position in the binary input
        Dim currentPosition As Integer = 0
        ' Declare a variable to hold the current binary chunk
        Dim currentBinaryChunk As String = ""
        ' Declare a variable to hold the current hexadecimal digit
        Dim currentHexDigit As String = ""

        ' Loop through the binary input in chunks of 4 bits
        While currentPosition < lengthOfBinary
            ' Extract the current chunk of 4 bits
            currentBinaryChunk = GetBinaryChunk(binaryInput, currentPosition)
            ' Convert the current binary chunk to a hexadecimal digit
            currentHexDigit = ConvertBinaryChunkToHex(currentBinaryChunk)
            ' Append the current hexadecimal digit to the hexadecimal output
            hexadecimalOutput &= currentHexDigit
            ' Move to the next chunk of 4 bits
            currentPosition += 4
        End While

        ' Display the hexadecimal output to the user
        Console.WriteLine("The hexadecimal equivalent is: " & hexadecimalOutput)
    End Sub

    ' Function to extract a chunk of 4 bits from the binary input
    Function GetBinaryChunk(binaryInput As String, position As Integer) As String
        ' Declare a variable to hold the binary chunk
        Dim binaryChunk As String = ""
        ' Loop through the next 4 bits
        For i As Integer = 0 To 3
            ' Check if the current position is within the length of the binary input
            If position + i < binaryInput.Length Then
                ' Append the current bit to the binary chunk
                binaryChunk &= binaryInput(position + i)
            Else
                ' Append a 0 to the binary chunk if the current position is out of bounds
                binaryChunk &= "0"
            End If
        Next
        ' Return the binary chunk
        Return binaryChunk
    End Function

    ' Function to convert a binary chunk to a hexadecimal digit
    Function ConvertBinaryChunkToHex(binaryChunk As String) As String
        ' Declare a variable to hold the decimal value of the binary chunk
        Dim decimalValue As Integer = 0
        ' Declare a variable to hold the current bit value
        Dim currentBitValue As Integer = 0

        ' Loop through the binary chunk
        For i As Integer = 0 To 3
            ' Calculate the value of the current bit
            currentBitValue = CInt(binaryChunk(3 - i).ToString()) * (2 ^ i)
            ' Add the current bit value to the decimal value
            decimalValue += currentBitValue
        Next

        ' Declare a variable to hold the hexadecimal digit
        Dim hexDigit As String = ""
        ' Convert the decimal value to a hexadecimal digit
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