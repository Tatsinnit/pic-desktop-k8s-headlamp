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

FROM ghcr.io/headlamp-k8s/headlamp:latest

# Copy plugins into the Headlamp plugins directory
COPY --from=builder /build/ /headlamp/plugins/aks

# (Optional) Set permissions if needed
USER root
RUN chown -R headlamp:headlamp /headlamp/plugins
USER headlamp

# The default CMD from the Headlamp image will be used