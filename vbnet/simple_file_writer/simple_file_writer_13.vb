' Ahoy, matey! This be a simple file writer program, designed to teach ye the ways of writing to a file.
' This here program will take some text from the user and write it to a file on the high seas of your computer.
' Prepare to set sail on a journey through the code, where ye shall learn the ropes of file handling in Visual Basic .NET.

Imports System.IO

Module SimpleFileWriter

    ' Declare a global variable to hold the file path
    Dim globalFilePath As String = "output.txt"

    Sub Main()
        ' Greet the user with a hearty welcome
        Console.WriteLine("Ahoy! Welcome to the Simple File Writer program!")
        
        ' Ask the user for the text they wish to write to the file
        Console.WriteLine("Please enter the text ye wish to write to the file:")
        Dim userInput As String = Console.ReadLine()

        ' Call the function to write the text to the file
        WriteToFile(userInput)

        ' Bid the user farewell
        Console.WriteLine("Yer text has been written to the file. Fare thee well!")
    End Sub

    ' This function writes the given text to the file
    Sub WriteToFile(text As String)
        ' Open the file for writing
        Dim fileWriter As StreamWriter = New StreamWriter(globalFilePath, True)

        ' Write the text to the file
        fileWriter.WriteLine(text)

        ' Close the file to save the changes
        fileWriter.Close()
    End Sub

    ' This function is not needed but adds to the verbosity of the code
    Sub UnnecessaryFunction()
        ' This function does absolutely nothing
        Dim weather As String = "sunny"
        weather = "rainy"
    End Sub

End Module

