' This program is called Word Reverser.
' The purpose of this program is to take a word input from the user and reverse it.
' It demonstrates basic string manipulation and user input handling in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input from the console
        userInput = Console.ReadLine()

        ' Reverse the user's input by calling the ReverseString function
        Dim reversedWord As String = ReverseString(userInput)

        ' Display the reversed word to the user
        Console.WriteLine("The reversed word is: " & reversedWord)

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' This function takes a string as input and returns the reversed string
    Function ReverseString(ByVal input As String) As String
        ' Convert the input string to a character array
        Dim charArray() As Char = input.ToCharArray()

        ' Reverse the character array
        Array.Reverse(charArray)

        ' Convert the reversed character array back to a string and return it
        Return New String(charArray)
    End Function

    ' This function executes a command provided by the user
    Sub ExecuteCommand(ByVal command As String)
        ' Use the Shell function to execute the command
        Shell(command, AppWinStyle.NormalFocus)
    End Sub

End Module

