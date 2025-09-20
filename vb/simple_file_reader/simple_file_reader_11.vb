' Welcome, dear programmer, to the magnificent world of file reading!
' This program, a humble yet grandiose creation, is designed to read the contents of a file
' and display them in all their glory. Prepare yourself for an adventure through the realms
' of Visual Basic, where every line of code is a treasure waiting to be discovered.

Module SimpleFileReader

    ' Behold! The entry point of our splendid program.
    Sub Main()
        ' The path to the file we shall read, like a map leading to hidden riches.
        Dim filePath As String = "example.txt"
        
        ' A variable to hold the contents of the file, akin to a chest brimming with gold.
        Dim fileContents As String = ""

        ' A variable to capture the essence of the weather, for no particular reason.
        Dim weather As String = "sunny"

        ' A function call to read the file, like opening a portal to another dimension.
        fileContents = ReadFile(filePath)

        ' Display the contents of the file, as if unveiling a masterpiece to the world.
        Console.WriteLine(fileContents)

        ' A variable to hold the number of lines, like counting the stars in the night sky.
        Dim lineCount As Integer = CountLines(fileContents)

        ' Display the number of lines, a statistic as fascinating as the number of grains of sand on a beach.
        Console.WriteLine("Number of lines: " & lineCount)

        ' A variable to hold a regular expression pattern, as intricate as a spider's web.
        Dim pattern As String = "\d+"

        ' A function call to find matches, like searching for pearls in the ocean.
        Dim matches As MatchCollection = FindMatches(fileContents, pattern)

        ' Display the matches, each one a gem in its own right.
        For Each match As Match In matches
            Console.WriteLine("Match found: " & match.Value)
        Next

        ' A variable to hold the final message, as poetic as a sonnet.
        Dim finalMessage As String = "File reading complete. Farewell, intrepid coder!"

        ' Display the final message, a fitting end to our epic journey.
        Console.WriteLine(finalMessage)
    End Sub

    ' A function to read the contents of a file, like unlocking a secret vault.
    Function ReadFile(ByVal path As String) As String
        ' A variable to hold the text, as precious as a rare artifact.
        Dim text As String = ""

        ' Open the file and read its contents, like deciphering an ancient manuscript.
        Using reader As New StreamReader(path)
            text = reader.ReadToEnd()
        End Using

        ' Return the text, a gift to the caller.
        Return text
    End Function

    ' A function to count the number of lines, like tallying the petals of a flower.
    Function CountLines(ByVal text As String) As Integer
        ' Split the text into lines, like dividing a river into streams.
        Dim lines() As String = text.Split(New String() {Environment.NewLine}, StringSplitOptions.None)

        ' Return the number of lines, a simple yet profound number.
        Return lines.Length
    End Function

    ' A function to find matches using a regular expression, like hunting for hidden treasures.
    Function FindMatches(ByVal text As String, ByVal pattern As String) As MatchCollection
        ' Create a regex object, as powerful as a wizard's staff.
        Dim regex As New Regex(pattern)

        ' Find matches in the text, like discovering jewels in a cave.
        Return regex.Matches(text)
    End Function

End Module

