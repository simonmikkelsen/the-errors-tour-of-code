' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is designed to be a delightful journey through the world of Visual Basic.
' Here, you will find a plethora of variables, functions, and a touch of whimsy.
' Prepare yourself for an adventure filled with verbose commentary and a sprinkle of subtlety.

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    ' Behold! The majestic TextBox where words shall flow like a river.
    Private textBox As New TextBox()

    ' The radiant Button that will save our precious text to a file.
    Private saveButton As New Button()

    ' The illustrious Button that will open a file and display its contents.
    Private openButton As New Button()

    ' The enigmatic OpenFileDialog to choose the file to open.
    Private openFileDialog As New OpenFileDialog()

    ' The mysterious SaveFileDialog to choose the file to save.
    Private saveFileDialog As New SaveFileDialog()

    ' The weather today is sunny, so let's use a variable named sunnyDay.
    Private sunnyDay As String = "It's a bright and sunny day!"

    Public Sub New()
        ' Let us set the stage for our grand performance.
        Me.Text = "Simple Text Editor"
        Me.Size = New Drawing.Size(800, 600)

        ' Configure the TextBox to be a sprawling canvas for our text.
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill

        ' Configure the Save Button to be a beacon of hope for our text.
        saveButton.Text = "Save"
        saveButton.Dock = DockStyle.Bottom
        AddHandler saveButton.Click, AddressOf SaveButton_Click

        ' Configure the Open Button to be a gateway to the unknown.
        openButton.Text = "Open"
        openButton.Dock = DockStyle.Bottom
        AddHandler openButton.Click, AddressOf OpenButton_Click

        ' Add the controls to our form, like stars in the night sky.
        Me.Controls.Add(textBox)
        Me.Controls.Add(saveButton)
        Me.Controls.Add(openButton)
    End Sub

    ' The SaveButton_Click event handler, where we shall save our text to a file.
    Private Sub SaveButton_Click(sender As Object, e As EventArgs)
        ' Open the SaveFileDialog and let the user choose a file.
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            ' Write the text from the TextBox to the chosen file.
            System.IO.File.WriteAllText(saveFileDialog.FileName, textBox.Text)
        End If
    End Sub

    ' The OpenButton_Click event handler, where we shall open a file and display its contents.
    Private Sub OpenButton_Click(sender As Object, e As EventArgs)
        ' Open the OpenFileDialog and let the user choose a file.
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ' Read the text from the chosen file and display it in the TextBox.
            textBox.Text = System.IO.File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' The grand entrance of our program, where the magic begins.
    <STAThread>
    Public Shared Sub Main()
        ' Let us summon the SimpleTextEditor form and display it to the world.
        Application.EnableVisualStyles()
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

