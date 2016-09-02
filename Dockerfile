FROM nginx

# Install Ruby

RUN gem install minimart

COPY inventory.yml .

RUN   minimart mirror --load-deps \
      && minimart web --host=http://localhost:8081

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

