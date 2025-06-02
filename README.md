# aks-headlamp

This is the default template README for [Headlamp Plugins](https://github.com/kubernetes-sigs/headlamp).

- The description of your plugin should go here.
- You should also edit the package.json file meta data (like name and description).

## Building and Deploying the Plugin

### Building the Docker Image

To build the plugin Docker image:

```bash
# Build the image
docker build -t ttl.sh/pic-desktop-k8s-headlamp:latest .
```

### Pushing to ttl.sh

[ttl.sh](https://ttl.sh) is a temporary container registry that automatically deletes images after 24 hours. It's useful for testing but not recommended for production use.

```bash
# Push to ttl.sh
docker push ttl.sh/pic-desktop-k8s-headlamp:latest
```

⚠️ **Important Notes about ttl.sh:**
- Images are automatically deleted after 24 hours
- No authentication required
- Not suitable for production deployments

## Developing Headlamp plugins

For more information on developing Headlamp plugins, please refer to:

- [Getting Started](https://headlamp.dev/docs/latest/development/plugins/), How to create a new Headlamp plugin.
- [API Reference](https://headlamp.dev/docs/latest/development/api/), API documentation for what you can do
- [UI Component Storybook](https://headlamp.dev/docs/latest/development/frontend/#storybook), pre-existing components you can use when creating your plugin.
- [Plugin Examples](https://github.com/kubernetes-sigs/headlamp/tree/main/plugins/examples), Example plugins you can look at to see how it's done.


