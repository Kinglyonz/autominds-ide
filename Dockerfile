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

# Copy startup script
COPY start.sh /usr/local/bin/start.sh

# Fix permissions and Windows line endings
USER root
RUN sed -i 's/\r$//' /usr/local/bin/start.sh && \
    chmod +x /usr/local/bin/start.sh
USER coder

# Start code-server using our script
CMD ["/usr/local/bin/start.sh"]
