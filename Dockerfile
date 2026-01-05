FROM codercom/code-server:latest

# Set environment variables (can be overridden by Railway Variables)
ENV PASSWORD=${PASSWORD:-demo}

# Switch to Microsoft Marketplace to allow Copilot and other VS Code extensions
ENV EXTENSIONS_GALLERY='{"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery", "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index", "itemUrl": "https://marketplace.visualstudio.com/items"}'

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
