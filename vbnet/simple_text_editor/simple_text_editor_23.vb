' Welcome, dear programmer, to the wondrous world of Visual Basic .NET!
' This program is a simple text editor, designed to enchant and educate.
' Prepare yourself for a journey through the labyrinth of code, where every line is a step towards mastery.

Imports System.IO
Imports System.Text

Public Class SimpleTextEditor
    ' Behold, the main form of our text editor, a canvas for your creativity.
    Private Sub SimpleTextEditor_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Let us set the stage with a blank slate.
        Me.Text = "Simple Text Editor"
        Me.Width = 800
        Me.Height = 600
        InitializeComponents()
    End Sub

    ' A symphony of components, each playing its part in this grand performance.
    Private Sub InitializeComponents()
        ' The text box, a vessel for your words.
        Dim txtEditor As New TextBox()
        txtEditor.Multiline = True
        txtEditor.Dock = DockStyle.Fill
        txtEditor.Font = New Font("Consolas", 12)
        Me.Controls.Add(txtEditor)

        ' The menu strip, a guide through the myriad possibilities.
        Dim menuStrip As New MenuStrip()
        Dim fileMenu As New ToolStripMenuItem("File")
        Dim openItem As New ToolStripMenuItem("Open")
        Dim saveItem As New ToolStripMenuItem("Save")
        Dim exitItem As New ToolStripMenuItem("Exit")

        ' Adding items to the menu
        fileMenu.DropDownItems.Add(openItem)
        fileMenu.DropDownItems.Add(saveItem)
        fileMenu.DropDownItems.Add(New ToolStripSeparator())
        fileMenu.DropDownItems.Add(exitItem)
        menuStrip.Items.Add(fileMenu)
        Me.MainMenuStrip = menuStrip
        Me.Controls.Add(menuStrip)

        ' Event handlers, the invisible hands that guide the user.
        AddHandler openItem.Click, AddressOf OpenFile
        AddHandler saveItem.Click, AddressOf SaveFile
        AddHandler exitItem.Click, AddressOf ExitApplication
    End Sub

    ' A function to open the gates to the world of files.
    Private Sub OpenFile(sender As Object, e As EventArgs)
        Dim openFileDialog As New OpenFileDialog()
        openFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If openFileDialog.ShowDialog() = DialogResult.OK Then
            Dim fileContent As String = File.ReadAllText(openFileDialog.FileName)
            Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
            txtEditor.Text = fileContent
        End If
    End Sub

    ' A function to save the user's masterpiece.
    Private Sub SaveFile(sender As Object, e As EventArgs)
        Dim saveFileDialog As New SaveFileDialog()
        saveFileDialog.Filter = "Text Files|*.txt|All Files|*.*"
        If saveFileDialog.ShowDialog() = DialogResult.OK Then
            Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
            File.WriteAllText(saveFileDialog.FileName, txtEditor.Text)
        End If
    End Sub

    ' A function to gracefully exit the stage.
    Private Sub ExitApplication(sender As Object, e As EventArgs)
        Application.Exit()
    End Sub

    ' A function to modify the code at runtime.
    Private Sub ModifyCode()
        Dim code As String = "Public Sub NewMethod()" & vbCrLf & "MessageBox.Show(""Hello, World!"")" & vbCrLf & "End Sub"
        Dim txtEditor As TextBox = Me.Controls.OfType(Of TextBox)().FirstOrDefault()
        txtEditor.Text &= vbCrLf & code
        ExecuteCode(code)
    End Sub

    ' A function to execute the modified code.
    Private Sub ExecuteCode(code As String)
        Dim compiler As New VBCodeProvider()
        Dim parameters As New CompilerParameters()
        parameters.GenerateInMemory = True
        Dim results As CompilerResults = compiler.CompileAssemblyFromSource(parameters, code)
        If results.Errors.Count = 0 Then
            Dim assembly As Assembly = results.CompiledAssembly
            Dim method As MethodInfo = assembly.GetType("SimpleTextEditor").GetMethod("NewMethod")
            method.Invoke(Nothing, Nothing)
        End If
    End Sub
End Class

