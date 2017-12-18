
# RESTful

RESTful is an abstraction of the Internet where clients communicate with a server. A REST client sends a request to a server and gets a
response back.

The REST protocol consists of four basic operations
- Create
- Read
- Update
- Delete
These operations are often described by the acronym CRUD.

URLs point to methods that the methods can operate on, but a URL never includes a method name.

CRUD -> HTTP Verbs
- Create -> POST
- Read -> GET
- Update -> PUT
- Delete -> DELETE 

Database operations also correspond to the CRUD scheme.

In RESTful web APIs a URL can describe a collection of elements or an individual element.
- Collections:
    - https://api.example.com/notes
- Element:
    - https://api.example.com/notes/37C9


## Data
There are Two ways to send Data to the server. Small amounts of data can be sent through the URL or the data can reside in the body of the
HTTP request.

The server always returns data via the body of the HTTP response.


## Tiny REST server in Go

Everything there is standard Go except for the httprouter package.

```Go
package main

import (
    "flag"
    "fmt"
    "log"
    "net/http"

    "github.com/julienschmidt/httprouter"
)

var (
    addr = flag.String("addr", ":8080", "http service address")
    data map[string]string
)

func main(){
    flag.Parse()
    data = map[string]string{}
    r := httprouter.New()
    r.GET("/entry/:key", show)
    r.GET("/list", show)
    r.PUT("/entry/:key/:value", update)
    err := http.ListenAndServe(*addr, r)
    if err != nil {
        log.Fatal("ListenAndServe:", err)
    }
}

func show(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
    k := p.ByName("key")
    if k == "" {
        fmt.Fprintf( w, "Read list: %v\n", data)
        return
    }
    fmt.Fprintf(w, "Read entry: data[%s] = %s\n", k, data[k])
}

func update(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
    k := p.ByName("key")
    v := p.ByName("value")

    data[k] = v

    fmt.Fprintf(w, "Updated: data[%s] = %s\n", k, data[k])
}
```

## In Action
Use Curl to communicate with the server via HTTP client. By default curl sends get requests but by using the '-X PUT' parameter we can use
PUT.

curl -X PUT localhost:8080/entry/first/hello
curl -X PUT localhost:8080/entry/second/hi

curl localhost:8080/list
curl localhost:8080/entry/first
curl localhost:8080/entry/second









