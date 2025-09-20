' This program, called List Merger, is designed to merge two lists of integers provided by the user.
' The program will prompt the user to input two lists of integers, merge them, and then display the merged list.
' The purpose of this program is to help programmers understand how to handle user inputs and perform list operations.

Module ListMerger

    Sub Main()
        ' Declare variables to hold the user input for the two lists
        Dim list1 As New List(Of Integer)
        Dim list2 As New List(Of Integer)

        ' Prompt the user to enter the first list of integers
        Console.WriteLine("Enter the first list of integers (comma-separated):")
        Dim input1 As String = Console.ReadLine()
        ' Convert the input string to a list of integers
        list1 = ConvertInputToList(input1)

        ' Prompt the user to enter the second list of integers
        Console.WriteLine("Enter the second list of integers (comma-separated):")
        Dim input2 As String = Console.ReadLine()
        ' Convert the input string to a list of integers
        list2 = ConvertInputToList(input2)

        ' Merge the two lists
        Dim mergedList As New List(Of Integer)
        mergedList.AddRange(list1)
        mergedList.AddRange(list2)

        ' Display the merged list
        Console.WriteLine("The merged list is:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next
        Console.WriteLine()

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a comma-separated string to a list of integers
    Function ConvertInputToList(input As String) As List(Of Integer)
        Dim result As New List(Of Integer)
        Dim items() As String = input.Split(","c)
        For Each item As String In items
            result.Add(CInt(item.Trim()))
        Next
        Return result
    End Function

End Module

