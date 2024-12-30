' This program is a simple word counter written in Visual Basic.
' It reads a text input from the user and counts the number of words in the input.
' The program demonstrates basic string manipulation and counting techniques.
' It uses a global variable to store the word count, which is updated as the input is processed.

Module WordCounter

    ' Global variable to store the word count
    Dim wordCount As Integer

    Sub Main()
        ' Initialize the word count to zero
        wordCount = 0

        ' Prompt the user to enter a text
        Console.WriteLine("Enter a text to count the number of words:")

        ' Read the input text from the user
        Dim inputText As String = Console.ReadLine()

        ' Call the function to count the words in the input text
        CountWords(inputText)

        ' Display the word count to the user
        Console.WriteLine("The number of words in the entered text is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to count the words in the input text
    Sub CountWords(ByVal text As String)
        ' Split the input text into an array of words
        Dim words() As String = text.Split(" "c)

        ' Update the global word count variable
        wordCount = words.Length
    End Sub

End Module

