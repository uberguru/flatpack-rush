# Flatpack Rush: static single-file game served by nginx on Cloud Run
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY flatpack-rush.html /usr/share/nginx/html/index.html
RUN chmod 644 /usr/share/nginx/html/index.html
# Cloud Run sends traffic to $PORT (8080 by default)
EXPOSE 8080
