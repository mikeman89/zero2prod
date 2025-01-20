# Use the Rust stable release build at time of writing Zero to Production in Rust
FROM rust:1.72.0
# Change working director to "app"
WORKDIR /app
# Install system dependencies
RUN apt update && apt install lld clang -y
# copy files into the container
COPY . .
# build the rust binary in release mode
RUN cargo build --release
# launch the binary when "docker run" is executed
ENTRYPOINT [ "./target/release/zero2prod" ]
