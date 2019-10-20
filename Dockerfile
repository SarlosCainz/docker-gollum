FROM ruby

MAINTAINER m-takuj@sarlos.jp

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN gem install gollum github-markdown

EXPOSE 80
VOLUME /wiki
WORKDIR /wiki

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["gollum", "--emoji", "--port", "80", "--allow-uploads", "--show-all"]
