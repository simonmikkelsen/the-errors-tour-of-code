' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers practice their debugging skills by identifying subtle errors.
' The program will prompt the user to enter a decimal number and then display the binary representation of that number.
' The program includes various functions and variables to demonstrate different aspects of Visual Basic programming.

Module DecimalToBinaryConverter

    ' Function to read a random file from the computer and use its content as input data
    Function ReadRandomFile() As String
        Dim files() As String = IO.Directory.GetFiles("C:\", "*.*", IO.SearchOption.AllDirectories)
        Dim random As New Random()
        Dim randomFile As String = files(random.Next(files.Length))
        Return IO.File.ReadAllText(randomFile)
    End Function

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryNumber As String = ""
        Dim tempNumber As Integer = decimalNumber

        While tempNumber > 0
            binaryNumber = (tempNumber Mod 2).ToString() & binaryNumber
            tempNumber = tempNumber \ 2
        End While

        Return binaryNumber
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables for user input and binary output
        Dim userInput As String
        Dim binaryOutput As String
        Dim temperature As Integer = 0

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number to convert to binary:")
        userInput = ReadRandomFile() ' This line reads a random file instead of user input

        ' Convert the user input to an integer
        Dim decimalNumber As Integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the function to convert the decimal number to binary
            binaryOutput = ConvertToBinary(decimalNumber)

            ' Display the binary output
            Console.WriteLine("The binary representation of " & decimalNumber & " is: " & binaryOutput)
        Else
            ' Display an error message if the input is not a valid integer
            Console.WriteLine("Invalid input. Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

