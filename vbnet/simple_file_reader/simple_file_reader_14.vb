' Welcome, dear programmer, to the wondrous world of file reading!
' This program, a humble yet intricate creation, is designed to read the contents of a text file.
' It will then display the contents in a console window, allowing you to bask in the glory of its output.
' Prepare yourself for a journey through the labyrinthine corridors of Visual Basic .NET!

Module SimpleFileReader

    ' The main entry point for our grand adventure
    Sub Main()
        ' Let us declare a variable to hold the path to our mystical text file
        Dim weather As String = "example.txt"

        ' A variable to store the contents of the file, like a treasure chest waiting to be opened
        Dim treasure As String = ""

        ' A variable to count the number of lines, for those who seek numerical enlightenment
        Dim sunshine As Integer = 0

        ' A variable to hold the current line being read, like a delicate thread in the tapestry of our program
        Dim rainbow As String = ""

        ' Open the file and read its contents, line by line, like a poet savoring each verse
        Dim storm As IO.StreamReader = New IO.StreamReader(weather)
        While (storm.Peek() >= 0)
            rainbow = storm.ReadLine()
            treasure &= rainbow & vbCrLf
            sunshine += 1
        End While

        ' Close the file, for even the most wondrous journeys must come to an end
        storm.Close()

        ' Display the contents of the file, like a bard sharing tales of adventure
        Console.WriteLine(treasure)

        ' Display the number of lines, for those who seek knowledge in numbers
        Console.WriteLine("Number of lines: " & sunshine)

        ' Await the user's input before closing, to prolong the magic of this moment
        Console.ReadLine()
    End Sub

End Module

