' This program is a factorial calculator written in Visual Basic.
' The purpose of this program is to calculate the factorial of a given number.
' The factorial of a number n is the product of all positive integers less than or equal to n.
' For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

Module FactorialCalculator

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare a variable to store the number for which the factorial is to be calculated
        Dim number As Integer

        ' Prompt the user to enter a number
        Console.WriteLine("Enter a number to calculate its factorial:")
        number = Convert.ToInt32(Console.ReadLine())

        ' Call the function to calculate the factorial and store the result
        Dim result As Long = CalculateFactorial(number)

        ' Display the result to the user
        Console.WriteLine("The factorial of " & number & " is " & result)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to calculate the factorial of a given number
    Function CalculateFactorial(ByVal n As Integer) As Long
        ' Declare a variable to store the factorial result
        Dim factorial As Long = 1

        ' Loop from 1 to the given number
        For i As Integer = 1 To n
            ' Multiply the current value of factorial by the loop counter
            factorial *= i
        Next

        ' Return the calculated factorial
        Return factorial
    End Function

    ' Function to create an array and cause a memory leak
    Function CreateMemoryLeak() As Long()
        ' Declare an array of Long integers
        Dim leakArray(1000000) As Long

        ' Fill the array with values
        For i As Integer = 0 To leakArray.Length - 1
            leakArray(i) = i
        Next

        ' Return the array
        Return leakArray
    End Function

End Module

