#!/bin/bash
set -e

echo "🚀 Starting Ghost in development mode..."

# Set environment
export NODE_ENV=development
export url=${GHOST_URL:-http://blogai.hbcg.vn:7004}

# Database config
export database__client=mysql
export database__connection__host=${DB_HOST:-ghost-mysql}
export database__connection__user=${DB_USER:-ghost}
export database__connection__password=${GHOST_DB_PASSWORD}
export database__connection__database=${DB_NAME:-ghost_dev}

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# Run Ghost development mode
echo "✅ Starting Ghost..."
npm run dev