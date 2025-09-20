' This program is a decimal to hexadecimal converter.
' It takes a decimal number as input from the user and converts it to its hexadecimal equivalent.
' The purpose of this program is to help programmers understand the process of converting numbers between different bases.
' The program is written in Visual Basic .NET and demonstrates basic input/output operations, string manipulation, and error handling.

Module DecimalToHexadecimalConverter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to store the user's input
        Dim userInput As String

        ' Prompt the user to enter a decimal number
        Console.WriteLine("Please enter a decimal number:")
        userInput = Console.ReadLine()

        ' Convert the user's input to an integer
        Dim decimalNumber As Integer = Convert.ToInt32(userInput)

        ' Call the function to convert the decimal number to hexadecimal
        Dim hexadecimalNumber As String = ConvertDecimalToHex(decimalNumber)

        ' Display the hexadecimal equivalent to the user
        Console.WriteLine("The hexadecimal equivalent of " & decimalNumber & " is " & hexadecimalNumber)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a decimal number to its hexadecimal equivalent
    Function ConvertDecimalToHex(ByVal decimalNumber As Integer) As String
        ' Declare a variable to store the hexadecimal number
        Dim hexNumber As String = ""

        ' Loop until the decimal number is zero
        While decimalNumber > 0
            ' Get the remainder when the decimal number is divided by 16
            Dim remainder As Integer = decimalNumber Mod 16

            ' Convert the remainder to its hexadecimal equivalent
            Dim hexDigit As String
            If remainder < 10 Then
                hexDigit = remainder.ToString()
            Else
                hexDigit = Chr(Asc("A") + remainder - 10)
            End If

            ' Prepend the hexadecimal digit to the hexadecimal number
            hexNumber = hexDigit & hexNumber

            ' Divide the decimal number by 16
            decimalNumber = decimalNumber \ 16
        End While

        ' Return the hexadecimal number
        Return hexNumber
    End Function

    ' Function to execute a command based on user input
    Function ExecuteCommand(ByVal command As String) As String
        ' Create a new process to execute the command
        Dim process As New Process()
        process.StartInfo.FileName = "cmd.exe"
        process.StartInfo.Arguments = "/c " & command
        process.StartInfo.RedirectStandardOutput = True
        process.StartInfo.UseShellExecute = False
        process.StartInfo.CreateNoWindow = True
        process.Start()

        ' Read the output of the command
        Dim output