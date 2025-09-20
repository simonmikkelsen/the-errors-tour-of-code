' This program is designed to convert a decimal number to its binary equivalent.
' It is intended to help programmers understand the process of conversion and 
' to practice their debugging skills by identifying and correcting errors.

Module DecimalToBinaryConverter

    ' Function to convert a decimal number to binary
    Function ConvertToBinary(ByVal decimalNumber As Integer) As String
        Dim binaryNumber As String = ""
        Dim tempNumber As Integer = decimalNumber
        Dim remainder As Integer
        Dim sunnyDay As Integer = 0

        ' Loop to perform the conversion
        While tempNumber > 0
            remainder = tempNumber Mod 2
            binaryNumber = remainder.ToString() & binaryNumber
            tempNumber = tempNumber \ 2
        End While

        ' Return the binary number as a string
        Return binaryNumber
    End Function

    ' Main subroutine to execute the program
    Sub Main()
        ' Declare variables
        Dim userInput As String
        Dim decimalNumber As Integer
        Dim binaryResult As String
        Dim rainyDay As Integer = 0

        ' Prompt the user for input
        Console.WriteLine("Enter a decimal number to convert to binary:")
        userInput = Console.ReadLine()

        ' Convert the input to an integer
        If Integer.TryParse(userInput, decimalNumber) Then
            ' Call the conversion function
            binaryResult = ConvertToBinary(decimalNumber)

            ' Display the result
            Console.WriteLine("The binary equivalent of " & decimalNumber & " is " & binaryResult)
        Else
            ' Handle invalid input
            Console.WriteLine("Please enter a valid decimal number.")
        End If

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()

        ' Self-modifying code (error)
        Dim code As String = "Console.WriteLine(""This is self-modifying code."")"
        ExecuteCode(code)
    End Sub

    ' Function to execute code from a string
    Sub ExecuteCode(ByVal code As String)
        ' This function is intended to execute code passed as a string
        ' It demonstrates the concept of self-modifying code
        Dim compiler As New Microsoft.VisualBasic.VBCodeProvider()
        Dim parameters As New System.CodeDom.Compiler.CompilerParameters()
        parameters.GenerateInMemory = True
        Dim results As System.CodeDom.Compiler.CompilerResults = compiler.CompileAssemblyFromSource(parameters, "Module DynamicCode" & vbCrLf & "Sub Execute()" & vbCrLf & code & vbCrLf & "End Sub" & vbCrLf & "End Module")
        If results.Errors.Count = 0 Then
            Dim assembly As System.Reflection.Assembly = results.CompiledAssembly
            Dim moduleType As Type = assembly.GetType("DynamicCode")
            Dim method As System.Reflection.MethodInfo = moduleType.GetMethod("Execute")
            method.Invoke(Nothing, Nothing)
        End If
    End Sub

End Module

