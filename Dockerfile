# First phase: build a project
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second phase
FROM nginx
EXPOSE 80
# Copy everything from a previous phase
COPY --from=builder /app/build /usr/share/nginx/html