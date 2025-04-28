# Sequential Thinking Server

A Model Context Protocol (MCP) server implementation for sequential thinking and complex problem-solving.

## Overview

This project provides an MCP-compatible server that enables AI models to break down complex problems into sequential thought steps. It's designed to support dynamic and reflective problem-solving processes that can adapt and evolve as understanding deepens.

The server implements a tool called `sequentialthinking` that helps analyze problems through a flexible thinking process, allowing each thought to build on, question, or revise previous insights.

## Key Features

- Break down complex problems into manageable steps
- Support for revising previous thoughts as understanding evolves
- Branching capabilities for exploring alternative approaches
- Dynamic adjustment of the number of thinking steps needed
- Visual formatting of thought processes
- Docker support for easy deployment

## Prerequisites

- Node.js (v16 or later)
- npm or yarn
- Docker and Docker Compose (optional, for containerized deployment)

## Installation

### Local Installation

1. Clone the repository:
   ```
   git clone <repository-url>
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

## Usage

### Running Locally

Start the server with:

```
npm start
```

Or run it directly after building:

```
node dist/index.js
```

### Docker Deployment

1. Build and start the Docker container:
   ```
   docker-compose up -d
   ```

2. The server will be available on port 3110.

## How It Works

The Sequential Thinking Server implements a thinking tool that:

1. Processes thoughts in sequential steps
2. Allows for thought revision and branching
3. Supports dynamic adjustment of the thinking process
4. Provides visual feedback on the thinking flow

Each thought contains metadata like:
- The thought content
- Current position in the sequence
- Total estimated thoughts needed
- Revision information (if applicable)
- Branching information (if applicable)

## API Reference

The server implements the Model Context Protocol and exposes the following tool:

### `sequentialthinking`

Enables structured thinking through sequential steps.

**Required parameters:**
- `thought`: The current thinking step (string)
- `thoughtNumber`: Current position in sequence (integer)
- `totalThoughts`: Estimated total thoughts needed (integer)
- `nextThoughtNeeded`: Whether another thought is needed (boolean)

**Optional parameters:**
- `isRevision`: Whether this revises previous thinking (boolean)
- `revisesThought`: Which thought is being reconsidered (integer)
- `branchFromThought`: Branching point thought number (integer)
- `branchId`: Branch identifier (string)
- `needsMoreThoughts`: If more thoughts are needed (boolean)

## Project Structure

- `index.ts`: Main server implementation
- `docker-compose.yml`: Docker Compose configuration
- `Dockerfile`: Docker configuration
- `package.json`: Project dependencies and scripts
- `tsconfig.json`: TypeScript configuration
- `data/`: Directory for persistent data (mounted as volume in Docker)

## License

MIT

---

Developed by Anthropic, PBC (https://anthropic.com)  
Homepage: https://modelcontextprotocol.io