# Use the official Node.js 18 image as the base image for building the plugins
FROM node:18@sha256:d0bbfdbad0bff8253e6159dcbee42141db4fc309365d5b8bcfce46ed71569078 AS builder

# Copy all source code into the container
COPY . .

# Install dependencies and build the plugin
RUN echo "Installing dependencies..."; \
    npm ci && \
    echo "Building plugin..."; \
    npm run build && \
    echo "Extracting plugin..."; \
    npx --no-install headlamp-plugin extract . /build/

FROM alpine:3.20.3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d

# Create a non-root user and group
RUN addgroup -S headlamp && adduser -S headlamp -G headlamp

# Copy the built plugin files from the builder stage to the /plugins directory in the final image
COPY --from=builder /build/ /plugins/

# Set appropriate permissions for the plugins directory
RUN chown -R headlamp:headlamp /plugins && \
    chmod -R 755 /plugins

LABEL org.opencontainers.image.source=https://github.com/headlamp-k8s/plugins
LABEL org.opencontainers.image.licenses=MIT

# Switch to non-root user
USER headlamp

# Set the default command to list the installed plugins
CMD ["sh", "-c", "echo Plugins installed at /plugins/:; ls /plugins/"]