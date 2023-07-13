package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", home)
	http.ListenAndServe(":8080", nil)
}

func home(w http.ResponseWriter, r *http.Request) {
	if r.Header.Get("x-forwarded-for") != "" {
		log.Println("received a request from (x-forwarded-for):", r.Header.Get("x-forwarded-for"))
	} else {
		log.Println("received a request from (remote address):", r.RemoteAddr)
	}
	w.Write([]byte("Hello, App!"))
}
