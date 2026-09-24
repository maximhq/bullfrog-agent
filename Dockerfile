FROM golang:1.25.14-bookworm@sha256:3b4a11519ad929d1e1d261a12cff056f0c85b735253d7d861346b9c6f8b36437

WORKDIR /agent

RUN apt-get update
RUN apt-get install --yes libnetfilter-queue-dev

COPY . ./

RUN go build -trimpath -ldflags=-buildid= -o agent ./cmd/agent
