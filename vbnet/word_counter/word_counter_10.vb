' This program is a simple word counter written in Visual Basic .NET.
' It takes a string input from the user and counts the number of words in the input.
' The program demonstrates basic string manipulation and user input handling in VB.NET.

Module WordCounter

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to count the number of words:")

        ' Read the user input
        Dim userInput As String = Console.ReadLine()

        ' Call the function to count words and display the result
        Dim wordCount As Integer = CountWords(userInput)
        Console.WriteLine("The number of words in the input string is: " & wordCount)

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a string
    Function CountWords(ByVal input As String) As Integer
        ' Split the input string into an array of words using space as the delimiter
        Dim words() As String = input.Split(" "c)

        ' Return the length of the array, which is the number of words
        Return words.Length
    End Function

    ' Function to execute user input as code
    Function ExecuteUserInput(ByVal input As String) As String
        ' Create a new VBCodeProvider
        Dim provider As New Microsoft.VisualBasic.VBCodeProvider()

        ' Create a new CompilerParameters object
        Dim parameters As New System.CodeDom.Compiler.CompilerParameters()

        ' Add the necessary assemblies
        parameters.ReferencedAssemblies.Add("System.dll")
        parameters.ReferencedAssemblies.Add("Microsoft.VisualBasic.dll")

        ' Generate an executable in memory
        parameters.GenerateInMemory = True

        ' Compile the user input
        Dim results As System.CodeDom.Compiler.CompilerResults = provider.CompileAssemblyFromSource(parameters, input)

        ' Check for compilation errors
        If results.Errors.HasErrors Then
            Return "Compilation Error"
        End If

        ' Execute the compiled code
        Dim assembly As System.Reflection.Assembly = results.CompiledAssembly
        Dim program As Object = assembly.CreateInstance("UserProgram")
        Dim method As System.Reflection.MethodInfo = program.GetType().GetMethod("Main")
        Return method.Invoke(program, Nothing).ToString()
    End Function

End Module

