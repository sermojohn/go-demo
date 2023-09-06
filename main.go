package main

import (
	"fmt"
	"io"
	"net/http"
)

func main() {
	fmt.Println("starting server")

	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		bd, err := io.ReadAll(r.Body)
		if err != nil {
			defer r.Body.Close()
		}
		fmt.Printf("%s %s\n", r.Method, r.URL.String())
		fmt.Printf("%s\n\n", string(bd))

		fmt.Fprintf(rw, "bye bye!")
	})

	err := http.ListenAndServe(":8080", nil)
	fmt.Printf("exit: %v", err)
}
