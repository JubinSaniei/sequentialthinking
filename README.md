# Sequential Thinking 🧠

![License](https://img.shields.io/badge/license-MIT-blue)
![Version](https://img.shields.io/badge/version-1.0.0-brightgreen)

> A powerful framework for sequential reasoning and decision-making in AI applications.

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Installation](#-installation)
  - [Docker Installation](#docker-installation-recommended)
  - [Manual Installation](#manual-installation)
- [Usage](#-usage)
  - [Running Locally](#running-locally)
  - [Open WebUI Integration](#open-webui-integration)
  - [Docker Usage](#docker-usage)
- [Dependencies](#-dependencies)
- [Deployment](#-deployment)
- [Contributing](#-contributing)
- [License](#-license)

## 🔍 Overview

This project provides an MCP-compatible server that enables AI models to break down complex problems into sequential thought steps. It's designed to support dynamic and reflective problem-solving processes that can adapt and evolve as understanding deepens.

The server implements a tool called `sequentialthinking` that helps analyze problems through a flexible thinking process, allowing each thought to build on, question, or revise previous insights.

## ✨ Features

- Break down complex problems into manageable steps
- Support for revising previous thoughts as understanding evolves
- Branching capabilities for exploring alternative approaches
- Dynamic adjustment of the number of thinking steps needed
- Visual formatting of thought processes
- Docker support for easy deployment

## 🚀 Installation

### Docker Installation (Recommended)

We recommend using Docker for the easiest setup experience:

#### Prerequisites

Install Docker and Docker Compose:

**For Linux:**
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

**For macOS and Windows:**  
Install Docker Desktop from the official website: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

### Manual Installation

1. Clone the repository:
   ```
   git clone https://github.com/JubinSaniei/sequentialthinking
   cd sequentialthinking
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Build the project:
   ```
   npm run build
   ```

## 🔧 Usage

### Running Locally

Start the server with:

```
npm start
```

Or run it directly after building:

```
node dist/index.js
```

### Open WebUI Integration

You can integrate Sequential Thinking with Open WebUI by following these steps:

https://docs.openwebui.com/openapi-servers/open-webui/

### Docker Usage

To deploy the application using Docker:

```bash
# Build and start the containers
docker compose up -d

# Stop and remove containers, networks
docker compose down

# Rebuild the containers (after making changes)
docker compose build

# Rebuild and restart the containers
docker compose up -d --build
```

The server will be available on port 3110.

## 📦 Dependencies

### MCPO

**Model Completion Protocol** (MCPO) is used to standardize communication between our application and various AI models.

- **What it does**: Provides a uniform interface for requesting completions from language models
- **Why we use it**: Simplifies integration with multiple AI providers and ensures consistent response handling

**Automatic Installation:**
MCPO is automatically installed during the Docker build process:
```bash
pip install mcpo
```

**How it's used:**
```bash
uvx mcpo --host 0.0.0.0 --port 8000
```

## 🚢 Deployment

### Docker Deployment

```bash
# Clone the repository
git clone https://github.com/yourusername/sequentialthinking.git
cd sequentialthinking

# Build and start the containers
docker compose up -d

# Stop and remove containers, networks
docker compose down

# Rebuild the containers (after making changes)
docker compose build

# Rebuild and restart the containers
docker compose up -d --build
```

### Production Considerations

## 👥 Contributing

We welcome contributions to improve the Sequential Thinking Server. Please adhere to the following guidelines:

- Fork the repository
- Create a new branch for your feature or bug fix
- Ensure your code adheres to the existing style
- Write clear, concise commit messages
- Submit a pull request detailing your changes

## 📄 License

MIT

---

Developed by Anthropic, PBC (https://anthropic.com)  
Homepage: https://modelcontextprotocol.io