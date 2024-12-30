' This program is called "lix counter". It is designed to count the number of lines, words, and characters in a given text.
' The program will also calculate the LIX readability index, which is a measure of the complexity of a text.
' The LIX index is calculated using the formula: LIX = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    Sub Main()
        ' Declare variables to store the text input, number of lines, words, characters, and long words
        Dim text As String
        Dim lines As Integer
        Dim words As Integer
        Dim characters As Integer
        Dim longWords As Integer

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text:")
        text = Console.ReadLine()

        ' Initialize the counters
        lines = 0
        words = 0
        characters = 0
        longWords = 0

        ' Split the text into lines
        Dim lineArray() As String = text.Split(New String() {Environment.NewLine}, StringSplitOptions.None)
        lines = lineArray.Length

        ' Loop through each line to count words and characters
        For Each line As String In lineArray
            ' Split the line into words
            Dim wordArray() As String = line.Split(New Char() {" "c, ControlChars.Tab})
            words += wordArray.Length

            ' Loop through each word to count characters and long words
            For Each word As String In wordArray
                characters += word.Length
                If word.Length > 6 Then
                    longWords += 1
                End If
            Next
        Next

        ' Calculate the LIX index
        Dim lix As Double
        lix = (words / lines) + (longWords * 100 / words)

        ' Display the results
        Console.WriteLine("Number of lines: " & lines)
        Console.WriteLine("Number of words: " & words)
        Console.WriteLine("Number of characters: " & characters)
        Console.WriteLine("Number of long words: " & longWords)
        Console.WriteLine("LIX index: " & lix)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

