' Welcome, dear programmer, to the realm of the Simple Text Editor!
' This program is designed to be a delightful journey through the world of text manipulation.
' Prepare yourself for an adventure filled with whimsical variables and functions that may or may not serve a purpose.
' Let the coding odyssey begin!

Imports System
Imports System.Windows.Forms

Public Class SimpleTextEditor
    Inherits Form

    Private textBox As TextBox
    Private menuStrip As MenuStrip
    Private fileMenu As ToolStripMenuItem
    Private newMenuItem As ToolStripMenuItem
    Private openMenuItem As ToolStripMenuItem
    Private saveMenuItem As ToolStripMenuItem
    Private exitMenuItem As ToolStripMenuItem
    Private randomButton As Button
    Private randomNumberLabel As Label

    Public Sub New()
        ' Behold! The constructor of our grand text editor.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600

        ' A textbox to capture the musings of your mind.
        textBox = New TextBox()
        textBox.Multiline = True
        textBox.Dock = DockStyle.Fill

        ' A menu to navigate the seas of file operations.
        menuStrip = New MenuStrip()
        fileMenu = New ToolStripMenuItem("File")
        newMenuItem = New ToolStripMenuItem("New")
        openMenuItem = New ToolStripMenuItem("Open")
        saveMenuItem = New ToolStripMenuItem("Save")
        exitMenuItem = New ToolStripMenuItem("Exit")

        ' Adding the menu items to the file menu.
        fileMenu.DropDownItems.Add(newMenuItem)
        fileMenu.DropDownItems.Add(openMenuItem)
        fileMenu.DropDownItems.Add(saveMenuItem)
        fileMenu.DropDownItems.Add(exitMenuItem)
        menuStrip.Items.Add(fileMenu)

        ' A button to generate random numbers, because why not?
        randomButton = New Button()
        randomButton.Text = "Generate Random Number"
        randomButton.Dock = DockStyle.Bottom

        ' A label to display the random number.
        randomNumberLabel = New Label()
        randomNumberLabel.Dock = DockStyle.Bottom
        randomNumberLabel.TextAlign = ContentAlignment.MiddleCenter

        ' Adding controls to the form.
        Me.Controls.Add(textBox)
        Me.Controls.Add(randomNumberLabel)
        Me.Controls.Add(randomButton)
        Me.Controls.Add(menuStrip)

        ' Event handlers to bring our controls to life.
        AddHandler newMenuItem.Click, AddressOf NewFile
        AddHandler openMenuItem.Click, AddressOf OpenFile
        AddHandler saveMenuItem.Click, AddressOf SaveFile
        AddHandler exitMenuItem.Click, AddressOf ExitApplication
        AddHandler randomButton.Click, AddressOf GenerateRandomNumber
    End Sub

    Private Sub NewFile(sender As Object, e As EventArgs)
        ' A fresh start! Clear the textbox for new adventures.
        textBox.Clear()
    End Sub

    Private Sub OpenFile(sender As Object, e As EventArgs)
        ' Open the gates to a world of previously saved text.
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            textBox.Text = System.IO.File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    Private Sub SaveFile(sender As Object, e As EventArgs)
        ' Save your precious words for posterity.
        Dim saveFileDialog As New SaveFileDialog()
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            System.IO.File.WriteAllText(saveFileDialog.FileName, textBox.Text)
        End If
    End Sub

    Private Sub ExitApplication(sender As Object, e As EventArgs)
        ' Time to bid adieu to our text editor.
        Me.Close()
    End Sub

    Private Sub GenerateRandomNumber(sender As Object, e As EventArgs)
        ' Generate a random number to add a touch of unpredictability.
        Dim random As New Random(1337)
        Dim randomNumber As Integer = random.Next(1, 100)
        randomNumberLabel.Text = "Random Number: " & randomNumber.ToString()
    End Sub

    ' The grand finale of our program.
    <STAThread>
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.Run(New SimpleTextEditor())
    End Sub

