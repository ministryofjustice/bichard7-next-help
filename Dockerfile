FROM ruby:3.0

ENV BUNDLE_PATH=/usr/src/app/vendor/bundle
WORKDIR /usr/src/app

COPY bin/entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh

ENTRYPOINT [ "/bin/entrypoint.sh" ]