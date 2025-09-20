' Ahoy, matey! This be a simple file reader program, designed to read the contents of a file and display it to the user.
' This here program be a treasure trove for young programmers, filled with hidden gems and subtle nuances.
' So hoist the sails and let's embark on this coding adventure!

Module SimpleFileReader

    ' Declare a global variable to hold the file path, arrr!
    Dim globalFilePath As String

    Sub Main()
        ' Set sail by asking the user for the file path
        Console.WriteLine("Ahoy! Enter the path to the file ye wish to read:")
        globalFilePath = Console.ReadLine()

        ' Call the function to read the file, arrr!
        ReadFile(globalFilePath)

        ' Drop anchor and wait for the user to press a key before exiting
        Console.WriteLine("Press any key to abandon ship...")
        Console.ReadKey()
    End Sub

    ' This function reads the contents of the file and displays it to the user
    Sub ReadFile(filePath As String)
        ' Declare a variable to hold the file contents, arrr!
        Dim fileContents As String = ""

        ' Try to open the file and read its contents
        Try
            ' Open the file and read all lines
            fileContents = My.Computer.FileSystem.ReadAllText(filePath)
        Catch ex As Exception
            ' If there be an error, display a message to the user
            Console.WriteLine("Shiver me timbers! There be an error reading the file: " & ex.Message)
            Return
        End Try

        ' Display the contents of the file to the user
        Console.WriteLine("Here be the contents of the file, arrr:")
        Console.WriteLine(fileContents)
    End Sub

End Module

