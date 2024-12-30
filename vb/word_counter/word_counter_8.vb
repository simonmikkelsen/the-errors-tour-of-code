' This program is a simple word counter written in Visual Basic.
' It reads a text input from the user, counts the number of words in the input,
' and displays the word count to the user. The program is designed to be 
' educational and demonstrate basic programming concepts such as input/output,
' string manipulation, and loops.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a text
        Console.WriteLine("Please enter a text to count the words:")

        ' Read the user's input
        userInput = Console.ReadLine()

        ' Declare a variable to hold the word count
        Dim wordCount As Integer

        ' Split the input text into words
        Dim words() As String = userInput.Split(" "c)

        ' Count the number of words
        wordCount = words.Length

        ' Display the word count to the user
        Console.WriteLine("The number of words in the entered text is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

