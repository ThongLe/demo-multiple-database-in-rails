FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /mnt/rails
COPY Gemfile /mnt/rails/
# COPY Gemfile.lock /mnt/rails/
WORKDIR /mnt/rails

# Bundle install
RUN bundle update && bundle install
COPY . /mnt/rails

EXPOSE 5000
