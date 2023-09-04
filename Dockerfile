FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY /hello .

RUN CGO_ENABLED=0 GOOS=linux go build -o program hello.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/program .

CMD ["./program"]