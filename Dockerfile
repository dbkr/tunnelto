FROM clux/muslrust:stable as builder

WORKDIR /src

COPY . /src
RUN cargo build --bin tunnelto_server --release

FROM alpine:latest

COPY --from=builder /src/target/release/tunnelto_server /tunnelto_server

# client svc
EXPOSE 8080
# ctrl svc
EXPOSE 5000
# net svc
EXPOSE 10002

ENTRYPOINT ["/tunnelto_server"]
