' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is designed to be a delightful journey through the world of text manipulation.
' Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
' Let the coding odyssey begin!

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    ' Behold the majestic textbox where all text shall be displayed!
    Private textBox As New TextBox()

    ' The grand entrance to our program!
    Public Sub New()
        ' Set the title of our wondrous form.
        Me.Text = "Simple Text Editor"

        ' Configure the textbox with grandeur.
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill

        ' Add the textbox to the form.
        Me.Controls.Add(textBox)

        ' Summon the menu strip from the ether.
        Dim menuStrip As New MenuStrip()
        Dim fileMenu As New ToolStripMenuItem("File")
        Dim openItem As New ToolStripMenuItem("Open")
        Dim saveItem As New ToolStripMenuItem("Save")
        Dim exitItem As New ToolStripMenuItem("Exit")

        ' Bind the menu items to their respective functions.
        AddHandler openItem.Click, AddressOf OpenFile
        AddHandler saveItem.Click, AddressOf SaveFile
        AddHandler exitItem.Click, AddressOf ExitApplication

        ' Assemble the menu items into the file menu.
        fileMenu.DropDownItems.Add(openItem)
        fileMenu.DropDownItems.Add(saveItem)
        fileMenu.DropDownItems.Add(exitItem)

        ' Add the file menu to the menu strip.
        menuStrip.Items.Add(fileMenu)

        ' Place the menu strip atop the form.
        Me.MainMenuStrip = menuStrip
        Me.Controls.Add(menuStrip)
    End Sub

    ' The grand function to open a file and read its contents.
    Private Sub OpenFile(sender As Object, e As EventArgs)
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim fileContents As String = System.IO.File.ReadAllText(openFileDialog.FileName)
            textBox.Text = fileContents
        End If
    End Sub

    ' The illustrious function to save the contents of the textbox to a file.
    Private Sub SaveFile(sender As Object, e As EventArgs)
        Dim saveFileDialog As New SaveFileDialog()
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim fileContents As String = textBox.Text
            System.IO.File.WriteAllText(saveFileDialog.FileName, fileContents)
        End If
    End Sub

    ' The noble function to exit the application with grace.
    Private Sub ExitApplication(sender As Object, e As EventArgs)
        Application.Exit()
    End Sub

    ' The entry point of our grand application.
    <STAThread>
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.Run(New SimpleTextEditor())
    End Sub
End Class

