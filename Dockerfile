FROM golang:alpine as builder
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN go build -o check

FROM alpine:latest
COPY --from=builder /build/check /check
WORKDIR /
ENTRYPOINT ["/check"]
