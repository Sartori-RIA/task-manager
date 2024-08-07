# Task Manager App


### Requirements

+ Docker and Docker Compose

### Starting the app

- RUN `docker compose up --build` -> only for the first time
- RUN `docker compose up` after the first time
- OPEN `http://localhost:3004/tasks`
  - default user: 
    - email: admin@email.com
    - password: 123456

### Containers

+ Adminer: `http://localhost:8080` 
+ Auth Service: `http://localhost:3001`
+ Notifications Service: `http://localhost:3002`
+ Scraping Service: `http://localhost:3003`
+ (UI) Task Service: `http://localhost:3004`


### Running Specs

+ docker compose exec auth bundle exec rspec
+ docker compose exec notifications bundle exec rspec
+ docker compose exec scraping bundle exec rspec
+ docker compose exec tasks bundle exec rspec

### Architecture

![docker containers](containers.svg)

### Libs used here:

+ UI
  + Bootstrap 5
  + Font Awesome 6
+ Security
  + Devise
  + Devise-JWT
  + Devise-argon2
  + Rack-CORS
  + Rack-attack
  + Validators
  + Brakeman
  + Bundle Audit
+ Testing
  + Rspec
  + Factory Bot
  + Parallel_tests
  + simplecov
+ Style Guide
  + Rubocop
+ HTTP requests
  + HTTParty
  + Nokogiri

### Author

[GitHub](https://github.com/Sartori-RIA)

[Linkedin](https://www.linkedin.com/in/lucas-antonio-ramos-sartori/)