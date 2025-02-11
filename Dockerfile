# Use a slim Ruby image as the base
FROM ruby:3.1-slim

ARG UID=1001
ARG GID=1001
ARG JEKYLL_VERSION='3.10.0'

# Set environment variables for UTF-8 encoding and non-interactive package installation
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Update package list
RUN apt update --fix-missing 

# Install essential build tools and dependencies
RUN apt install -y \
    build-essential \
    git \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler and Jekyll gems
RUN gem update bundler &&\ 
    gem install bundler &&\
    gem install jekyll -v "${JEKYLL_VERSION}"

# Set the working directory inside the container
WORKDIR /usr/src/app

# Set bundle path so that it persists outside the container
RUN bundle config path 'vendor/bundle' --local

# Expose port 4000
EXPOSE 4000

RUN groupadd -g "${GID}" jekyll &&\
    useradd -u "${UID}" -g "${GID}" -m -d /tmp/jekyll jekyll &&\
    chown -R jekyll:jekyll /usr/src/app

# Set app runtime user
USER jekyll
