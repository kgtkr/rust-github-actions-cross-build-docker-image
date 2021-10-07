FROM debian:buster-slim

ENV HOME=/home/app
WORKDIR $HOME

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY exe/ $HOME/exe/

RUN mv $HOME/exe/`arch`-unknown-linux-gnu-exe $HOME/rust-github-actions-cross-build-docker-image && \
    chmod +x $HOME/rust-github-actions-cross-build-docker-image && \
    rm -rf exe/

CMD ["./rust-github-actions-cross-build-docker-image"]
