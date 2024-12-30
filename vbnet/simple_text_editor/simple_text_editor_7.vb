' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program is a simple text editor, designed to enchant you with its simplicity and elegance.
' Prepare to embark on a journey where you will manipulate text with the grace of a maestro conducting a symphony.
' Let the adventure begin!

Imports System.IO

Public Class SimpleTextEditor
    ' Behold, the main form of our text editor, where all the magic happens!
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Ah, the gentle breeze of initialization, setting the stage for our text editing escapades.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600
    End Sub

    ' A textbox as vast as the ocean, ready to hold your every thought and whim.
    Private WithEvents txtEditor As New TextBox With {
        .Multiline = True,
        .Dock = DockStyle.Fill,
        .Font = New Font("Consolas", 12)
    }

    ' A menu to guide you through the labyrinth of text editing features.
    Private Sub CreateMenu()
        Dim menuStrip As New MenuStrip()
        Dim fileMenu As New ToolStripMenuItem("File")
        Dim openItem As New ToolStripMenuItem("Open")
        Dim saveItem As New ToolStripMenuItem("Save")
        Dim exitItem As New ToolStripMenuItem("Exit")

        ' The gentle zephyr of event handlers, connecting the menu items to their respective actions.
        AddHandler openItem.Click, AddressOf OpenFile
        AddHandler saveItem.Click, AddressOf SaveFile
        AddHandler exitItem.Click, AddressOf ExitApplication

        ' Adding the menu items to the file menu, like stars adorning the night sky.
        fileMenu.DropDownItems.Add(openItem)
        fileMenu.DropDownItems.Add(saveItem)
        fileMenu.DropDownItems.Add(exitItem)
        menuStrip.Items.Add(fileMenu)

        ' Setting the menu strip to the form, like a crown upon a king's head.
        Me.MainMenuStrip = menuStrip
        Me.Controls.Add(menuStrip)
        Me.Controls.Add(txtEditor)
    End Sub

    ' The gentle caress of the open file dialog, inviting you to select a file to open.
    Private Sub OpenFile(sender As Object, e As EventArgs)
        Dim openFileDialog As New OpenFileDialog()
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            txtEditor.Text = File.ReadAllText(openFileDialog.FileName)
        End If
    End Sub

    ' The warm embrace of the save file dialog, allowing you to save your precious text.
    Private Sub SaveFile(sender As Object, e As EventArgs)
        Dim saveFileDialog As New SaveFileDialog()
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            File.WriteAllText(saveFileDialog.FileName, txtEditor.Text)
        End If
    End Sub

    ' The gentle whisper of the exit command, guiding you to close the application.
    Private Sub ExitApplication(sender As Object, e As EventArgs)
        Application.Exit()
    End Sub

    ' The main entry point of our program, where the journey begins.
    Public Shared Sub Main()
        Application.EnableVisualStyles()
        Application.SetCompatibleTextRenderingDefault(False)
        Application.Run(New SimpleTextEditor())
    End Sub

    ' The final flourish, where we create the menu and set the stage for text editing.
    Public Sub New()
        CreateMenu()
    End Sub
End Class

