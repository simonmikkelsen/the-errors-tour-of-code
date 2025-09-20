' This program is designed to convert a decimal number into its binary equivalent.
' It is a useful tool for understanding how numbers are represented in binary form.
' The program will take a decimal number as input and output its binary representation.
' It is intended to help programmers practice their skills and spot potential issues.

Imports System.IO

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryNumber As String = ""
        Dim remainder As Integer
        Dim tempNumber As Integer = decimalNumber

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryNumber = remainder.ToString() & binaryNumber
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary representation
        Return binaryNumber
    End Function

    ' Function to read a random file from the computer
    Function ReadRandomFile() As String
        Dim files() As String = Directory.GetFiles("C:\")
        Dim random As New Random()
        Dim randomFile As String = files(random.Next(files.Length))
        Return File.ReadAllText(randomFile)
    End Function

    Sub Main()
        ' Declare variables for user input and binary output
        Dim userInput As String
        Dim binaryOutput As String
        Dim weather As Integer

        ' Prompt the user for a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to binary
        binaryOutput = ConvertToBinary(decimalNumber)

        ' Display the binary output to the user
        Console.WriteLine("The binary representation of " & decimalNumber & " is " & binaryOutput)

        ' Read random file content (not used in the program)
        Dim randomFileContent As String = ReadRandomFile()

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

