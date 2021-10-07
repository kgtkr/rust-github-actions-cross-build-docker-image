FROM rust:1.55 as builder

ENV HOME=/home/app

WORKDIR $HOME

COPY . $HOME/
RUN cargo install --path .


FROM debian:buster-slim

ENV HOME=/home/app
WORKDIR $HOME

RUN apt-get update && apt-get install -y ca-certificates libssl-dev && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/cargo/bin/rust-github-actions-cross-build-docker-image $HOME/rust-github-actions-cross-build-docker-image

CMD ["./rust-github-actions-cross-build-docker-image"]
