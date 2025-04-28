FROM python:alpine AS python-base

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

# Install Node.js
RUN apk update && apk add --no-cache \
    curl \
    nodejs \
    npm

# Install uv package manager
RUN pip install uv

FROM python-base AS builder

# Copy current directory
COPY . /app

WORKDIR /app

# Update the tsconfig.json to not rely on parent file
# RUN sed -i 's/"extends": "..\/..\/tsconfig.json",//' tsconfig.json

# Install Python dependencies using uv with --system flag
RUN uv pip install --system -r requirements.txt

# Install Node.js dependencies
RUN npm install
RUN npm ci --ignore-scripts --omit-dev

FROM python-base AS release

COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/package-lock.json /app/package-lock.json
COPY --from=builder /app/requirements.txt /app/requirements.txt

ENV NODE_ENV=production

WORKDIR /app

# Install Python dependencies in the release environment with --system flag
RUN uv pip install --system -r requirements.txt
# Install mcpo package for the MCP server
RUN uv pip install --system mcpo

# Install Node.js dependencies
RUN npm ci --ignore-scripts --omit-dev

# Expose the port that the application listens on.
EXPOSE 8000

# Use uvx to run the MCP server
ENTRYPOINT ["uvx", "mcpo", "--host", "0.0.0.0", "--port", "8000","--", "node", "dist/index.js"]