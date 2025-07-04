# Use a minimal base image
FROM alpine:latest

# Install the squid proxy software
RUN apk update && apk add --no-cache squid

# Copy our new squid configuration file into the image
COPY squid.conf /etc/squid/squid.conf

# Create the necessary cache and log directories, and set correct permissions
RUN mkdir -p /var/cache/squid && \
    chown -R squid:squid /var/cache/squid && \
    squid -z

# Expose the internal port and run squid
EXPOSE 3128
CMD ["squid", "-N"]