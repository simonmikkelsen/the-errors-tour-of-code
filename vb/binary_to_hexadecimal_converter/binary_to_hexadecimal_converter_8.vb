' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
' Prepare yourself for a journey through the realms of binary and hexadecimal, where each bit and nibble tells a story.

Module BinaryToHexadecimalConverter

    ' The main entry point of our grand program
    Sub Main()
        ' Declare a variable to hold the binary input from the user
        Dim binaryInput As String

        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number, and behold its hexadecimal transformation:")
        binaryInput = Console.ReadLine()

        ' Convert the binary input to a hexadecimal string
        Dim hexOutput As String = ConvertBinaryToHex(binaryInput)

        ' Display the resulting hexadecimal number
        Console.WriteLine("The hexadecimal equivalent of the binary number " & binaryInput & " is " & hexOutput)

        ' Await the user's admiration before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' A function that performs the conversion from binary to hexadecimal
    Function ConvertBinaryToHex(ByVal binary As String) As String
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String = ""

        ' Ensure the binary string length is a multiple of 4 by padding with leading zeros
        Dim paddedBinary As String = binary.PadLeft(((binary.Length + 3) \ 4) * 4, "0"c)

        ' Iterate through the binary string in chunks of 4 bits
        For i As Integer = 0 To paddedBinary.Length - 1 Step 4
            ' Extract a chunk of 4 bits
            Dim fourBits As String = paddedBinary.Substring(i, 4)

            ' Convert the 4-bit chunk to a hexadecimal digit
            Dim hexDigit As String = ConvertFourBitsToHex(fourBits)

            ' Append the hexadecimal digit to the result
            hexResult &= hexDigit
        Next

        ' Return the final hexadecimal result
        Return hexResult
    End Function

    ' A function that converts a 4-bit binary string to a single hexadecimal digit
    Function ConvertFourBitsToHex(ByVal fourBits As String) As String
        ' Declare a variable to hold the hexadecimal digit
        Dim hexDigit As String

        ' Use a select case statement to determine the hexadecimal digit
        Select Case fourBits
            Case "0000"
                hexDigit = "0"
            Case "0001"
                hexDigit = "1"
            Case "0010"
                hexDigit = "2"
            Case "0011"
                hexDigit = "3"
            Case "0100"
                hexDigit = "4"
            Case "0101"
                hexDigit = "5"
            Case "0110"
                hexDigit = "6"
            Case "0111"
                hexDigit = "7"
            Case "1000"
                hexDigit = "8"
            Case "1001"
                hexDigit = "9"
            Case "1010"
                hexDigit = "A"
            Case "1011"
                hexDigit = "B"
            Case "1100"
                hexDigit = "C"
            Case "1101"
                hexDigit = "D"
            Case "1110"
                hexDigit = "E"
            Case "1111"
                hexDigit = "F"
            Case Else
                hexDigit = "?"
        End Select

        ' Return the hexadecimal digit
        Return