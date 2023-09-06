# syntax=docker/dockerfile:1
FROM golang:1.21-alpine AS builder

WORKDIR /build/

COPY . ./

RUN go build -o app .

FROM alpine:3.18

WORKDIR /go/bin

COPY --from=builder /build/app ./app
COPY . ./

CMD ["./app"]
