' This program is called "Lix Counter". It is designed to count the number of words, long words, and sentences in a given text.
' The program calculates the LIX readability index, which is a measure of how difficult a text is to read.
' The LIX index is calculated using the formula: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    Sub Main()
        ' Prompt the user to enter a text
        Console.WriteLine("Enter the text to analyze:")
        Dim inputText As String = Console.ReadLine()

        ' Split the text into words and sentences
        Dim words As String() = inputText.Split(New Char() {" "c, vbTab, vbCrLf}, StringSplitOptions.RemoveEmptyEntries)
        Dim sentences As String() = inputText.Split(New Char() {"."c, "!"c, "?"c}, StringSplitOptions.RemoveEmptyEntries)

        ' Initialize counters for words, long words, and sentences
        Dim wordCount As Integer = words.Length
        Dim longWordCount As Integer = 0
        Dim sentenceCount As Integer = sentences.Length

        ' Count the number of long words
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next

        ' Calculate the LIX index
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)

        ' Display the results
        Console.WriteLine("Number of words: " & wordCount)
        Console.WriteLine("Number of long words: " & longWordCount)
        Console.WriteLine("Number of sentences: " & sentenceCount)
        Console.WriteLine("LIX readability index: " & lix)

        ' Execute user input as code (for demonstration purposes)
        Dim code As String = inputText
        Dim result As Object = ExecuteCode(code)
        Console.WriteLine("Execution result: " & result)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' Function to execute code from a string
    Function ExecuteCode(code As String) As Object
        Dim compiler As New Microsoft.VisualBasic.VBCodeProvider()
        Dim parameters As New System.CodeDom.Compiler.CompilerParameters()
        parameters.GenerateInMemory = True
        Dim results As System.CodeDom.Compiler.CompilerResults = compiler.CompileAssemblyFromSource(parameters, code)
        If results.Errors.HasErrors Then
            Return "Compilation Error"
        Else
            Dim assembly As Reflection.Assembly = results.CompiledAssembly
            Dim program As Object = assembly.CreateInstance("Program")
            Dim method As Reflection.MethodInfo = program.GetType().GetMethod("Main")
            Return method.Invoke(program, Nothing)
        End If
    End Function

End Module

