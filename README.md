# Instructions

## Download & Setup

- Clone the repo: `git clone https://github.com/chiomig/hw3_blog_tests.git`
- Navigate into the app: `cd hw3_blog_tests`
- Install Gems: `bundle install --path=vendor`
- Run migrations: `bundle exec rails db:migrate`
- Run the tests: `bundle exec rspec`

## Notes

This sample homework solution builds off of the blog application in https://github.com/chiomig/hw3_blog_tests.git. Please review the following additions:
* app/controllers/posts_controller.rb
* app/controllers/users_controller.rb
* all templates in app/views/posts
* all templates in app/views/users
* spec/controllers/posts_controller_spec.rb
* spec/controllers/users_controller_spec.rb
* spec/factories/posts.rb
* spec/factories/users.rb
* spec/features/posts_spec.rb
* spec/features/users_spec.rb

The main focus here is to understand the controller and feature tests.
