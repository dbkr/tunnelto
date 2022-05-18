FROM ubuntu:focal

RUN apt-get update && \
    apt-get install --quiet --assume-yes \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./target/release/tunnelto_server /tunnelto_server

# client svc
EXPOSE 8080
# ctrl svc
EXPOSE 5000
# net svc
EXPOSE 10002

ENTRYPOINT ["/tunnelto_server"]
