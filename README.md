# README

This README would normally document whatever steps are necessary to get the
application up and running.


## Steps used to create inital app
```bash
docker-compose -f ./src/docker-compose.yml run --no-deps web rails new . --force --skip-active-record --skip-action-cable --skip-active-storage

```

## Development
### Set up the Talisman pre-commit hook
Install Talisman Globally:
```bash
curl --silent https://raw.githubusercontent.com/thoughtworks/talisman/master/global_install_scripts/install.bash | bash

```


### Set up local environment
Create an .env file in the root and populate it as follows:
```
GITHUB_USERNAME=YOUR_GITHUB_USERNAME
GITHUB_PERSONAL_ACCESS_TOKEN=YOUR_GITHUB_PERSONAL_ACCESS_TOKEN

```

Then run the following command to inject these environment variables into your shell:
```bash
export `cat .env | xargs`

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



## build docker locally
Set your `GITHUB_USERNAME` and `GITHUB_PERSONAL_ACCESS_TOKEN` environment variables, then run...
```bash
docker build \
                  -f ./docker/Dockerfile \
                  -t hello-world-hex-ruby--web-rails:$(git rev-parse HEAD) \
                  --platform linux/amd64 \
                  --secret id=github-username,env=GITHUB_USERNAME \
                  --secret id=github-personal-access-token,env=GITHUB_PERSONAL_ACCESS_TOKEN \
                  ./src
```

### Start server
Build and start the docker container
```bash
docker-compose -f ./docker/docker-compose.yml --build

```
Alternatively run the prep-built docker image
```bash
docker build \
        -f ./docker/Dockerfile \
        -t hello-world-hex-ruby--web-rails:$(git rev-parse HEAD) \
        --platform linux/amd64 \
        --secret id=github-username,env=GITHUB_USERNAME \
        --secret id=github-personal-access-token,env=GITHUB_PERSONAL_ACCESS_TOKEN \
        ./src

docker run --platform linux/amd64 -p 3000:3000 hello-world-hex-ruby--web-rails:$(git rev-parse HEAD)
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

### Download image from registry
```bash
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin ${ECR_REGISTRY}

```


## ECS

### Set up environment
Update the `container_image` in [the dev environment](./terraform/environments/dev/main.tf) to match the image pushed to the ECR
Via the terminal launch the environment in the cloud:
```bash
cd terraform/environments/dev/
tfswitch # select the latest terraform version
terraform init
terraform plan
terraform apply --auto-approve

```
This will launch an ECS service serving the app behind an application load balancer
Navigate to the `alb_dns_name` output to check that the app is being served as expected
E.g `curl HelloWorldHexRubyWebRailsLB-333426525.eu-west-2.elb.amazonaws.com`

### Destroy environment
```bash
terraform destroy --auto-approve

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



