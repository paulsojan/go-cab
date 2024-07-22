# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.0.5"

# friends of Rails
gem "sass-rails", ">= 6"
gem "uglifier", ">= 2.7.1"

gem "shakapacker"

# React
gem "react-rails"

# database
gem "pg"

# Application server
gem "puma"

# JSON builder
gem "jbuilder", ">= 2.7"

gem "bcrypt", "~> 3.1.13"

# Support cross-browser css compatibility
gem "autoprefixer-rails"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.9.4", require: false

# Background jobs
gem "sidekiq", "<8"

group :development, :test do
  # Rails integration for factory-bot
  gem "factory_bot_rails"

  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  # supports both syntax - pry and byebug
  gem "pry-byebug"

  # For auto-generating demo data
  gem "faker", "~> 2.19"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code
  gem "web-console"

  # reports N+1 queries
  gem "bullet"

  # A Ruby static code analyzer, based on the community Ruby style guide
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  # For linting ERB files
  gem "erb_lint", require: false, git: "https://github.com/Shopify/erb-lint.git", branch: "main"

  # vulnerability checker for Ruby itself
  gem "ruby_audit", require: false
end

group :test do
  # Complete suite of testing facilities
  gem "minitest"

  # for test coverage report
  gem "simplecov", require: false

  # Minitest reporter plugin for CircleCI.
  gem "minitest-ci"
end

gem "geocoder"
