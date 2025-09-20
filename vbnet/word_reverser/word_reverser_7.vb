' This program is called Word Reverser.
' The purpose of this program is to reverse the words in a given sentence.
' The program takes a sentence as input from the user, splits the sentence into words,
' reverses the order of the words, and then joins them back into a single string.
' Finally, it displays the reversed sentence to the user.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a sentence
        Console.WriteLine("Enter a sentence to reverse:")
        
        ' Read the input sentence from the user
        Dim inputSentence As String = Console.ReadLine()
        
        ' Split the sentence into words using space as the delimiter
        Dim words() As String = inputSentence.Split(" "c)
        
        ' Reverse the order of the words
        Array.Reverse(words)
        
        ' Join the reversed words back into a single string
        Dim reversedSentence As String = String.Join(" ", words)
        
        ' Display the reversed sentence to the user
        Console.WriteLine("Reversed sentence: " & reversedSentence)
        
        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
        
        ' Clear the console (This line is the subtle error)
        Console.Clear()
    End Sub

End Module

