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




## ECR
Registry URI: `757721680185.dkr.ecr.eu-west-2.amazonaws.com/hello-world-hex-ruby-web-rails`

1. Tag the image
```bash
docker tag docker-web:latest 757721680185.dkr.ecr.eu-west-2.amazonaws.com/hello-world-hex-ruby-web-rails:v3
```
2. Push tagged image to ECR
Configure cli to connect to ECR
```bash
aws ecr get-login --no-include-email --region eu-west-2
docker push 757721680185.dkr.ecr.eu-west-2.amazonaws.com/hello-world-hex-ruby-web-rails:v3
```

NB: If you encounter a `no basic auth credentials` error run this `eval $( aws ecr get-login --no-include-email --region eu-west-2 )` before attempting to push again


## ECS

* Task: defines how to run your container 
 - which containers to run, how many cpu's the container needs
* Service: Launch Task to run 1 or more containers at the same time and connect them to Load Balancers



1. Build an ECS cluster
Create a new cluster



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



