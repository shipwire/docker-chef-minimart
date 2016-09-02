FROM nginx

RUN apt-get update && apt-get upgrade -y libapt-pkg4.12
RUN apt-get install -y wget \
  build-essential \
  openssl \
  libreadline6 \
  libreadline6-dev \
  zlib1g \
  zlib1g-dev \
  libssl-dev \
  ncurses-dev \
  libyaml-dev \
  ruby-dev \
  gcc

RUN gem install minimart

COPY inventory.yml .

RUN   minimart mirror --load-deps \
      && minimart web --host=http://localhost:8081

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8081

