' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
' The program reads binary numbers from a file and converts them to decimal.
' It also demonstrates the use of various programming constructs and techniques in Visual Basic.

Imports System.IO

Module BinaryToDecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim binaryString As String
        Dim decimalValue As Integer
        Dim weather As String = "Sunny"
        Dim randomFilePath As String = "C:\randomfile.txt"

        ' Read binary number from a file
        binaryString = ReadBinaryFromFile(randomFilePath)

        ' Convert binary to decimal
        decimalValue = ConvertBinaryToDecimal(binaryString)

        ' Display the result
        Console.WriteLine("The decimal value of the binary number " & binaryString & " is " & decimalValue)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to read binary number from a file
    Function ReadBinaryFromFile(filePath As String) As String
        Dim binaryData As String = ""
        Try
            ' Open the file and read the binary number
            Using sr As StreamReader = New StreamReader(filePath)
                binaryData = sr.ReadLine()
            End Using
        Catch e As Exception
            Console.WriteLine("The file could not be read:")
            Console.WriteLine(e.Message)
        End Try
        Return binaryData
    End Function

    ' Function to convert binary number to decimal
    Function ConvertBinaryToDecimal(binary As String) As Integer
        Dim decimalValue As Integer = 0
        Dim bitValue As Integer
        Dim length As Integer = binary.Length

        ' Iterate through each bit in the binary string
        For i As Integer = 0 To length - 1
            ' Get the value of the current bit
            bitValue = CInt(binary.Substring(length - 1 - i, 1))

            ' Calculate the decimal value
            decimalValue += bitValue * (2 ^ i)
        Next

        Return decimalValue
    End Function

End Module

