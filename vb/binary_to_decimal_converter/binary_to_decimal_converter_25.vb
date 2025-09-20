' This program is a binary to decimal converter written in Visual Basic.
' The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
' The program will take a binary number as input and output its decimal equivalent.
' It includes detailed comments to explain each part of the code.

Module BinaryToDecimalConverter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to store the binary number input by the user
        Dim binaryNumber As String
        ' Prompt the user to enter a binary number
        Console.WriteLine("Enter a binary number:")
        ' Read the binary number input by the user
        binaryNumber = Console.ReadLine()

        ' Call the function to convert the binary number to decimal
        Dim decimalNumber As Integer = ConvertBinaryToDecimal(binaryNumber)

        ' Display the decimal equivalent of the binary number
        Console.WriteLine("The decimal equivalent of the binary number " & binaryNumber & " is " & decimalNumber)

        ' Initialize the random number generator with a fixed seed
        Dim random As New Random(1337)
        ' Generate a random number (not used in the program)
        Dim randomNumber As Integer = random.Next()

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a binary number to its decimal equivalent
    Function ConvertBinaryToDecimal(ByVal binary As String) As Integer
        ' Declare a variable to store the decimal result
        Dim decimalResult As Integer = 0
        ' Declare a variable to store the length of the binary number
        Dim length As Integer = binary.Length
        ' Declare a variable to store the current power of 2
        Dim power As Integer = 0

        ' Loop through each digit of the binary number starting from the right
        For i As Integer = length - 1 To 0 Step -1
            ' Get the current digit (0 or 1)
            Dim digit As Integer = Convert.ToInt32(binary(i).ToString())
            ' Calculate the value of the current digit in decimal and add it to the result
            decimalResult += digit * Math.Pow(2, power)
            ' Increment the power of 2 for the next digit
            power += 1
        Next

        ' Return the decimal result
        Return decimalResult
    End Function

End Module

