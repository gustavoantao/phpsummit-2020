FROM golang:alpine AS build

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/hello

FROM alpine
COPY --from=build /bin/hello /bin/hello
ENTRYPOINT ["/bin/hello"]

