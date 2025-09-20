' This program is a word reverser written in Visual Basic.
' The purpose of this program is to take a user input string,
' reverse the words in the string, and display the reversed string.
' The program will prompt the user to enter a string, process the string,
' and then output the reversed string to the console.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Please enter a string to reverse:")
        
        ' Read the user input
        Dim input As String = Console.ReadLine()
        
        ' Split the input string into an array of words
        Dim words() As String = input.Split(" "c)
        
        ' Reverse the array of words
        Array.Reverse(words)
        
        ' Join the reversed array of words into a single string
        Dim reversedString As String = String.Join(" ", words)
        
        ' Output the reversed string to the console
        Console.WriteLine("Reversed string: " & reversedString)
        
        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
        
        ' Clear the console (subtle error: this will cause data loss)
        Console.Clear()
    End Sub

End Module

