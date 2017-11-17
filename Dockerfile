FROM gcr.io/google_appengine/ruby

RUN rbenv install -s 2.4.1 && \
    rbenv global 2.4.1 && \
    gem install -q --no-rdoc --no-ri bundler --version 1.10.6 && \
    gem install -q --no-rdoc --no-ri foreman --version 0.78.0
ENV RBENV_VERSION 2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmagickwand-dev imagemagick

COPY . /app/

RUN bundle install

CMD ["bundle", "exec", "rails", "s"]
