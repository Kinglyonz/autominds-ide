FROM codercom/code-server:latest

# Set environment variables (can be overridden by Railway Variables)
ENV PASSWORD=${PASSWORD:-demo}

# Create workspace directory
USER coder
WORKDIR /home/coder/project

# Copy welcome files
COPY --chown=coder:coder workspace/ /home/coder/project/

# Expose port (Railway will use $PORT)
EXPOSE 8080

# Start code-server using sh -c to ensure environment variables like $PORT are expanded correctly
CMD ["/bin/sh", "-c", "code-server --bind-addr 0.0.0.0:${PORT:-8080} --auth password /home/coder/project"]
