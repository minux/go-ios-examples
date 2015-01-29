package main

// use blank import of "runtime/cgo" to force external linking
import _ "runtime/cgo"

import "fmt"

func main() {
	fmt.Println("hello world")
}
