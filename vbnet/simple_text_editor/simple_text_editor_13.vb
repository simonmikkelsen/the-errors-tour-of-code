' Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous seas of programming.
' With this here program, ye can open, edit, and save text files to yer heart's content.
' Prepare yerself for a journey filled with verbose comments and a plethora of variables and functions!

Imports System.IO

Public Class SimpleTextEditor
    ' Declare the global variable to hold the text file content
    Dim globalTextContent As String = ""

    ' This be the main form load event, where we set sail on our adventure
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Set the title of the form to welcome the user aboard
        Me.Text = "Welcome Aboard the Simple Text Editor!"
    End Sub

    ' This function be for opening a text file and loading its content into the text box
    Private Sub OpenFile()
        ' Create a new OpenFileDialog to let the user choose a file
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        openFileDialog.Title = "Open a Text File"

        ' If the user selects a file, read its content and set it to the global variable
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            globalTextContent = File.ReadAllText(openFileDialog.FileName)
            TextBox1.Text = globalTextContent
        End If
    End Sub

    ' This function be for saving the content of the text box to a file
    Private Sub SaveFile()
        ' Create a new SaveFileDialog to let the user choose where to save the file
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
        saveFileDialog.Title = "Save the Text File"

        ' If the user selects a location, write the content of the text box to the file
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            File.WriteAllText(saveFileDialog.FileName, TextBox1.Text)
        End If
    End Sub

    ' This function be for clearing the text box, like a fresh breeze on a sunny day
    Private Sub ClearText()
        TextBox1.Clear()
    End Sub

    ' This function be for exiting the program, like a ship sailing into the sunset
    Private Sub ExitProgram()
        Me.Close()
    End Sub

    ' This function be for setting the text box content to the global variable
    Private Sub SetTextBoxContent()
        TextBox1.Text = globalTextContent
    End Sub

    ' This function be for updating the global variable with the text box content
    Private Sub UpdateGlobalTextContent()
        globalTextContent = TextBox1.Text
    End Sub

    ' This function be for showing a message box with the current weather
    Private Sub ShowWeather()
        MessageBox.Show("The weather be fair and sunny, perfect for coding!")
    End Sub

    ' This function be for displaying a pirate joke to lighten the mood
    Private Sub ShowPirateJoke()
        MessageBox.Show("Why don't pirates take a bath before they walk the plank? Because they'll just wash up on shore later!")
    End Sub

    ' This function