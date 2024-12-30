// File Merger Program
// This be a program to merge the contents of multiple files into one single file.
// Arrr, it reads the contents of each file and writes them into a new file.
// Beware, ye landlubbers, for this code be complex and full of perilous variables and functions.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

var globalBuffer []byte // Global buffer for reading files

func main() {
    // Arrr, ye must provide at least two files to merge
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <outputfile> <inputfile1> <inputfile2> ...")
        return
    }

    outputFile := os.Args[1]
    inputFiles :=