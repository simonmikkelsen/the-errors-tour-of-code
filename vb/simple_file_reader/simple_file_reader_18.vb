' Welcome, dear programmer, to the wondrous world of file reading!
' This program is designed to take you on a journey through the labyrinthine corridors of file handling.
' Prepare yourself for an adventure filled with twists, turns, and the occasional unexpected surprise.
' Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous.
' Fear not, for they are all part of the grand tapestry that is this program.

Module SimpleFileReader

    ' The main entry point for our grand adventure
    Sub Main()
        ' Behold, the declaration of our variables, each with a story to tell
        Dim filePath As String = "C:\example.txt"
        Dim fileContent As String = ""
        Dim weather As String = "sunny"
        Dim temperature As Integer = 75
        Dim randomFilePath As String = GetRandomFilePath()

        ' Let us embark on our quest to read the contents of a file
        fileContent = ReadFileContent(filePath)
        Console.WriteLine("File Content: " & fileContent)

        ' A sudden twist! We shall now read from a random file
        fileContent = ReadFileContent(randomFilePath)
        Console.WriteLine("Random File Content: " & fileContent)

        ' The end of our journey is nigh, but the memories shall linger
        Console.WriteLine("The weather today is " & weather & " with a temperature of " & temperature & " degrees.")
    End Sub

    ' A function to read the content of a file, a key part of our adventure
    Function ReadFileContent(ByVal path As String) As String
        Dim content As String = ""
        Try
            content = My.Computer.FileSystem.ReadAllText(path)
        Catch ex As Exception
            Console.WriteLine("An error occurred while reading the file: " & ex.Message)
        End Try
        Return content
    End Function

    ' A whimsical function to get a random file path, adding an element of surprise to our journey
    Function GetRandomFilePath() As String
        Dim random As New Random()
        Dim randomNumber As Integer = random.Next(1, 4)
        Dim randomPath As String = ""

        Select Case randomNumber
            Case 1
                randomPath = "C:\random1.txt"
            Case 2
                randomPath = "C:\random2.txt"
            Case 3
                randomPath = "C:\random3.txt"
        End Select

        Return randomPath
    End Function

End Module

