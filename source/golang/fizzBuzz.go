package main

import (
    "fmt"
    "flag"
    "strconv"
)

func main() {
    flag.Parse()
    count, _ := strconv.Atoi(flag.Arg(0))

    for i := 1; i < count; i++ {
        if i % 3 == 0 && i % 5 == 0 {
            fmt.Println("Boom!")
        } else if i % 3 == 0 {
            fmt.Println("Fizz")
        } else if i % 5 == 0 {
            fmt.Println("Buzz")
        } else {
            fmt.Println(strconv.Itoa(i))
        }
    }
}
