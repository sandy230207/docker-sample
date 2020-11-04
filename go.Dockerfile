FROM golang:1.15-alpine
WORKDIR /go-web
COPY main.go /go-web
RUN go build -o web main.go
ENV FIRST_NAME go
EXPOSE 8000
ENTRYPOINT ./web