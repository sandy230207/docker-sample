FROM golang:1.15-alpine AS builder
WORKDIR /go-web
COPY main.go /go-web
RUN go build -o web main.go

FROM alpine:latest
COPY --from=builder /go-web/web .
ENV FIRST_NAME alpine
EXPOSE 8000
ENTRYPOINT ./web