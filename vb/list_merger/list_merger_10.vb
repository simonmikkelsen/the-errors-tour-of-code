' This program is called List Merger.
' The purpose of this program is to merge two lists of integers provided by the user.
' The program will prompt the user to input two lists of integers, merge them, and display the result.
' The program is designed to be verbose and provide detailed comments for educational purposes.

Module ListMerger

    Sub Main()
        ' Declare variables to hold user input
        Dim input1 As String
        Dim input2 As String

        ' Prompt the user to enter the first list of integers
        Console.WriteLine("Enter the first list of integers separated by commas:")
        input1 = Console.ReadLine()

        ' Prompt the user to enter the second list of integers
        Console.WriteLine("Enter the second list of integers separated by commas:")
        input2 = Console.ReadLine()

        ' Convert the input strings to arrays of integers
        Dim list1 As List(Of Integer) = ConvertInputToList(input1)
        Dim list2 As List(Of Integer) = ConvertInputToList(input2)

        ' Merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Display the merged list
        Console.WriteLine("The merged list is:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next

        ' Wait for user input before closing the program
        Console.WriteLine()
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to convert a comma-separated string to a list of integers
    Function ConvertInputToList(ByVal input As String) As List(Of Integer)
        Dim result As New List(Of Integer)
        Dim elements() As String = input.Split(","c)
        For Each element As String In elements
            result.Add(CInt(element.Trim()))
        Next
        Return result
    End Function

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        Dim result As New List(Of Integer)
        result.AddRange(list1)
        result.AddRange(list2)
        Return result
    End Function

End Module

