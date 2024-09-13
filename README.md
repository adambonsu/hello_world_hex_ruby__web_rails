# README

This README would normally document whatever steps are necessary to get the
application up and running.


## Development
### Set up local environment
Create an .env file in the root and populate it as follows:
```
GITHUB_USERNAME=YOUR_GITHUB_USERNAME
GITHUB_PERSONAL_ACCESS_TOKEN=YOUR_GITHUB_PERSONAL_ACCESS_TOKEN

```
Create a clean development environment
```bash
rvm use 3.0.0
rvm gemset create hello-world-hex-ruby--web-rails
rvm use 3.0.0@hello-world-hex-ruby--web-rails

```

### Initialise local environment
```bash
cd hello_world_hex_ruby__web__rails
gem install bundler
export `cat ../.env | xargs`
bundle install

```

### Start server
```bash
rails server

```
Navigate to http://127.0.0.1:3000/greetings/hello


## To do
* Create a `./bin/setup` like the core project that sets up the rvm and the environment
* Create a pipeline


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
