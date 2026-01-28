FROM codercom/code-server:latest

# No authentication required - open access to IDE
# Switch to Microsoft Marketplace to allow Copilot and other VS Code extensions
ENV EXTENSIONS_GALLERY='{"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery", "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index", "itemUrl": "https://marketplace.visualstudio.com/items"}'

# Create workspace directory
# Install "Sovereign Dev Pack" Extensions
# 1. Continue (Local AI) - "Continue.continue"
# 2. Thunder Client (API Testing) - "rangav.vscode-thunder-client"
# 3. Material Icons (Visuals) - "PKief.material-icon-theme"
# 4. Git Graph (History) - "mhutchie.git-graph"
# 5. Prettier (Formatting) - "esbenp.prettier-vscode"
# 6. ESLint (Linting) - "dbaeumer.vscode-eslint"

RUN code-server --install-extension Continue.continue && \
    code-server --install-extension rangav.vscode-thunder-client && \
    code-server --install-extension PKief.material-icon-theme && \
    code-server --install-extension mhutchie.git-graph && \
    code-server --install-extension esbenp.prettier-vscode && \
    code-server --install-extension dbaeumer.vscode-eslint

# Copy welcome files to a template directory
COPY workspace/ /usr/local/share/workspace/

# Expose port (Railway will use $PORT)
EXPOSE 8080

# Copy startup script
COPY start.sh /usr/local/bin/start.sh

# Copy AutoMinds CLI tools
COPY am-deploy /usr/local/bin/am-deploy
RUN chmod +x /usr/local/bin/am-deploy

# Fix permissions and Windows line endings
USER root
RUN sed -i 's/\r$//' /usr/local/bin/start.sh && \
    chmod +x /usr/local/bin/start.sh
USER coder

# Start code-server using our script
CMD ["/usr/local/bin/start.sh"]
