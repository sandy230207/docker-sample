package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
)

func sayhelloWorld(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	for k, v := range r.Form {
		fmt.Println("key:", k)
		fmt.Println("val:", strings.Join(v, ", "))
	}
	if r.Form["name"] != nil {
		fmt.Fprintf(w, "Hello "+r.Form["name"][0])
		return
	}
	fmt.Fprintf(w, "Hello "+os.Getenv("FIRST_NAME")+" "+os.Getenv("LAST_NAME")+"!")
}

func main() {
	if os.Getenv("FIRST_NAME") == "" {
		fmt.Printf("You did not set the environment variable: FIRST_NAME")
		return
	}
	http.HandleFunc("/", sayhelloWorld)
	err := http.ListenAndServe(":8000", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
