' This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
' It is a splendid tool for programmers to practice their skills and sharpen their minds.
' The program uses the power of regular expressions to perform the conversion, adding a touch of elegance and sophistication.

Module BinaryToHexadecimalConverter

    ' Function to convert binary to hexadecimal
    Function ConvertBinaryToHexadecimal(ByVal binary As String) As String
        ' Declare a variable to hold the hexadecimal result
        Dim hexResult As String = String.Empty

        ' Regular expression to match binary digits
        Dim binaryRegex As New System.Text.RegularExpressions.Regex("^[01]+$")
        
        ' Check if the input is a valid binary number
        If Not binaryRegex.IsMatch(binary) Then
            ' If not, return an error message
            Return "Invalid binary number"
        End If

        ' Pad the binary number with leading zeros to make its length a multiple of 4
        Dim paddedBinary As String = binary.PadLeft(((binary.Length + 3) \ 4) * 4, "0"c)

        ' Loop through the binary number in chunks of 4 digits
        For i As Integer = 0 To paddedBinary.Length - 1 Step 4
            ' Extract a chunk of 4 binary digits
            Dim binaryChunk As String = paddedBinary.Substring(i, 4)

            ' Convert the binary chunk to a decimal number
            Dim decimalValue As Integer = Convert.ToInt32(binaryChunk, 2)

            ' Convert the decimal number to a hexadecimal digit
            Dim hexDigit As String = decimalValue.ToString("X")

            ' Append the hexadecimal digit to the result
            hexResult &= hexDigit
        Next

        ' Return the final hexadecimal result
        Return hexResult
    End Function

    ' Main subroutine to demonstrate the conversion
    Sub Main()
        ' Declare a variable to hold the binary input
        Dim binaryInput As String = "1101"

        ' Call the conversion function and store the result
        Dim hexOutput As String = ConvertBinaryToHexadecimal(binaryInput)

        ' Display the result to the user
        Console.WriteLine("The hexadecimal equivalent of the binary number " & binaryInput & " is " & hexOutput)
    End Sub

End Module

