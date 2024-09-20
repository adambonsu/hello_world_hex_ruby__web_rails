# README

This README would normally document whatever steps are necessary to get the
application up and running.


## Steps used to create inital app
```bash
docker-compose -f ./src/docker-compose.yml run --no-deps web rails new . --force --skip-active-record --skip-action-cable --skip-active-storage

```

## Development
### Set up local environment
Create an .env file in the root and populate it as follows:
```
GITHUB_USERNAME=YOUR_GITHUB_USERNAME
GITHUB_PERSONAL_ACCESS_TOKEN=YOUR_GITHUB_PERSONAL_ACCESS_TOKEN

```
Create a clean development environment
```bash
rvm use 3.3.5
rvm gemset create hello-world-hex-ruby--web-rails
rvm use 3.3.5@hello-world-hex-ruby--web-rails
gem install bundler

```


### Initialise local environment
```bash
rvm use 3.3.5@hello-world-hex-ruby--web-rails
cd src
bundle install
cd -
```


### Start server
Build and start the docker container
```bash
docker-compose -f ./docker/docker-compose.yml --env-file .env up --build

```


Navigate to http://127.0.0.1:3000




Find diffs between ci-cd and main
```bash
git diff ci-cd..merge-working-rails-into-main  --name-only

```


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



