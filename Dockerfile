# Use a minimal base image
FROM alpine:latest

# Install the tinyproxy software
RUN apk update && apk add --no-cache tinyproxy

# Copy our configuration file into the image
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Expose the internal port and run the proxy
EXPOSE 8888
CMD ["tinyproxy", "-d"]