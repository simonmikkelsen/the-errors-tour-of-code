' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine you have a large file, and you want to break it down into smaller chunks for easier handling.
' This program will take care of that for you, with a sprinkle of magic and a touch of elegance.
' Let's embark on this enchanting journey together!

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare our variables with whimsical names
        Dim inputFilePath As String = "input.txt"
        Dim outputDirectory As String = "output"
        Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
        Dim gandalf As FileStream = Nothing
        Dim frodo As StreamReader = Nothing
        Dim aragorn As StreamWriter = Nothing

        Try
            ' Open the input file with the grace of an elven queen
            gandalf = New FileStream(inputFilePath, FileMode.Open, FileAccess.Read)
            frodo = New StreamReader(gandalf)

            ' Create the output directory if it doesn't exist
            If Not Directory.Exists(outputDirectory) Then
                Directory.CreateDirectory(outputDirectory)
            End If

            Dim buffer(chunkSize - 1) As Char
            Dim bytesRead As Integer
            Dim chunkIndex As Integer = 0

            ' Read the input file and create chunks with the precision of a dwarven blacksmith
            Do
                bytesRead = frodo.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    Dim chunkFileName As String = Path.Combine(outputDirectory, "chunk_" & chunkIndex.ToString() & ".txt")
                    aragorn = New StreamWriter(chunkFileName)
                    aragorn.Write(buffer, 0, bytesRead)
                    aragorn.Close()
                    chunkIndex += 1
                End If
            Loop While bytesRead > 0

        Catch ex As Exception
            ' Handle any unexpected errors with the wisdom of a wizard
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Close the input file with the gentleness of a hobbit
            If frodo IsNot Nothing Then frodo.Close()
            If gandalf IsNot Nothing Then gandalf.Close()
        End Try

        ' Bid farewell to our enchanting program
        Console.WriteLine("File splitting completed with grace and beauty.")
    End Sub

End Module

