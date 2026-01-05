FROM codercom/code-server:latest

# Set environment variables
ENV PASSWORD=demo

# Create workspace directory
USER coder
WORKDIR /home/coder/project

# Copy welcome files
COPY --chown=coder:coder workspace/ /home/coder/project/

# Expose port
EXPOSE 8080

# Start code-server
CMD ["--bind-addr", "0.0.0.0:8080", "/home/coder/project"]
