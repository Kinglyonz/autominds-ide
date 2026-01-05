# Autominds Cloud IDE

Production-ready browser-based development environment.

## Quick Start (Local)

```bash
docker-compose up -d
# Access at http://localhost:8080
# Password: demo
```

## Deploy to Railway (Recommended)

1. Install Railway CLI: `npm install -g @railway/cli`
2. Login: `railway login`
3. Initialize: `railway init`
4. Deploy: `railway up`
5. Add custom domain: `try.autominds.org`

## Environment Variables

| Variable | Description |
|----------|-------------|
| `PASSWORD` | Login password (default: demo) |
| `GITHUB_CLIENT_ID` | GitHub OAuth Client ID |
| `GITHUB_CLIENT_SECRET` | GitHub OAuth Client Secret |

## Files

- `docker-compose.yml` - Local development
- `Dockerfile` - Cloud deployment
- `railway.toml` - Railway configuration
- `workspace/` - Default user workspace

## GitHub OAuth

Configured with:
- Client ID: `Ov23liYxWV9l3BmtQcMx`
- Callback: `https://try.autominds.org/login/oauth2/callback`
