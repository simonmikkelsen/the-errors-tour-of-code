// Welcome to the Simple Database program! This delightful program is designed to
// help you understand the basics of creating and managing a simple in-memory database.
// It will guide you through the process of adding, retrieving, and deleting records
// with a touch of elegance and grace. Let's embark on this enchanting journey together!

package main

import (
    "fmt"
    "strings"
)

// Record represents a single entry in our charming database.
type Record struct {
    ID