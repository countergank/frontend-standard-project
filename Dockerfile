# Build stage: compile the Vite SPA into static assets
FROM node:22-alpine AS build
WORKDIR /app

# Enable pnpm via corepack (matches packageManager in package.json)
RUN corepack enable

# Install dependencies first to leverage Docker layer caching
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy source and build
COPY . .
RUN pnpm build

# Runtime stage: serve the static build with nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
