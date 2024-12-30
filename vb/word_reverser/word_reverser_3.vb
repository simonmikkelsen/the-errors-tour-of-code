' This program is called Word Reverser.
' The purpose of this program is to take a word input from the user,
' reverse the word, and then display the reversed word back to the user.
' The program demonstrates basic string manipulation and user input/output in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input
        userInput = Console.ReadLine()

        ' Reverse the user's input
        Dim reversedWord As String = ReverseString(userInput)

        ' Display the reversed word
        Console.WriteLine("The reversed word is: " & reversedWord)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse a string
    Function ReverseString(ByVal input As String) As String
        ' Convert the string to a character array
        Dim charArray() As Char = input.ToCharArray()

        ' Reverse the character array
        Array.Reverse(charArray)

        ' Convert the character array back to a string and return it
        Return New String(charArray)
    End Function

    ' Function to simulate a resource that needs to be closed
    Function GetResource() As IO.StreamReader
        ' Open a file and return the StreamReader
        Return New IO.StreamReader("dummy.txt")
    End Function

    ' Function to demonstrate a resource leak
    Sub DemonstrateResourceLeak()
        ' Get the resource but do not close it
        Dim resource As IO.StreamReader = GetResource()
        ' Use the resource (not actually used in this example)
    End Sub

End Module

