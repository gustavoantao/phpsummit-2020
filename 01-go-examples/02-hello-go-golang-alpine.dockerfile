FROM golang:alpine

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/hello

ENTRYPOINT ["/bin/hello"]
