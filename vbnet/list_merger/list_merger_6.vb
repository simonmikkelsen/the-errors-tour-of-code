' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will prompt the user to enter two lists of integers, separated by commas.
' It will then merge these lists and display the merged list.
' The program is designed to help programmers understand how to handle user input and merge lists.

Module ListMerger

    Sub Main()
        ' Declare variables to hold the user input and the merged list
        Dim input1 As String
        Dim input2 As String
        Dim list1 As List(Of Integer)
        Dim list2 As List(Of Integer)
        Dim mergedList As List(Of Integer)

        ' Prompt the user to enter the first list of integers
        Console.WriteLine("Enter the first list of integers, separated by commas:")
        input1 = Console.ReadLine()

        ' Convert the first input string to a list of integers
        list1 = ConvertInputToList(input1)

        ' Prompt the user to enter the second list of integers
        Console.WriteLine("Enter the second list of integers, separated by commas:")
        input2 = Console.ReadLine()

        ' Convert the second input string to a list of integers
        list2 = ConvertInputToList(input2)

        ' Merge the two lists
        mergedList = MergeLists(list1, list2)

        ' Display the merged list
        Console.WriteLine("The merged list is:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next
        Console.WriteLine()

    End Sub

    ' Function to convert a comma-separated string to a list of integers
    Function ConvertInputToList(ByVal input As String) As List(Of Integer)
        Dim result As New List(Of Integer)
        Dim elements() As String = input.Split(","c)

        For Each element As String In elements
            result.Add(Convert.ToInt32(element.Trim()))
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

