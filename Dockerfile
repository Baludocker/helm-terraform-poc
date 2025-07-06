FROM nginx:1.25-alpine
RUN echo "<h1> NGINX Index for GCP on $(date) </h1>" > /usr/share/nginx/html/index.html
