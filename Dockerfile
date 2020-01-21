FROM jekyll/builder

ENV http_proxy "http://127.0.0.1:3128"
ENV https_proxy "http://127.0.0.1:3128"
ENV HTTP_PROXY "http://127.0.0.1:3128"
ENV HTTPS_PROXY "http://127.0.0.1:3128"
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN gem update --system
RUN bundle install

FROM jekyll/jekyll

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll", "serve", "--livereload", "-H", "0.0.0.0"]
