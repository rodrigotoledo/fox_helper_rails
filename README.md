# World of Ruby on Rails 8, Tailwind and Full Users setup

Unlock the power of Ruby on Rails 8 and build modern web applications with ease! In this course, you'll master the essentials of Rails combined with the sleek styling of Tailwind. But we’re not stopping there. Until now the Ruby on Rails don't have the registrations mechanism, so here you will understand about it.

## Dependencies

Ruby using **asdf** and last version of **Ruby on Rails**.

For asdf just follow the instructions in https://asdf-vm.com/guide/getting-started.html

And after this install ruby on rails with the following command:

```bash
gem install bundler --no-doc
gem install rails --no-doc
```

## Creating a new application

Learn how to quickly set up a new Ruby on Rails 8 application, configure Tailwind for styling, and prepare your project for web and mobile development.

With the following command you can create a new application using tailwind and main branch of ruby on rails.

```bash
rails new fox_helper_rails -c tailwind --main

cd fox_helper_rails

rails g controller home index
```

Update the `config/routes.rb` and lets put home#index to initialize the application

## Structure of application

The idea of this course is show how have the same result using your fullstack Ruby on Rails but create a native applications for Android and Apple devices. For this the application will have these modules:

- Registration and Authorization
- Dependents how take of you
- Testing

### Authorization

Until now, when we try create the full authentication, since we use by default tailwind, the generator will try to create the .erb files using him, but they don't exists. So, tailwind-css gem isn't with main branch until now, you need set in `Gemfile` using this branch with:

```Gemfile
gem "tailwindcss-rails", github: "rails/tailwindcss-rails", branch: "main"
```

And after just run:

```bash
bundle update
bin/rails generate authentication
```

But maybe the gem `tailwindcss-rails` ins't prepare for the new version of `rails`, so after run `generate authentication` you need to manually remove the `main` branch from `Gemfile`.

```Gemfile
gem "tailwindcss-rails"
```

And now start server

```bash
bin/dev
```

Run migrations and just access localhost:3000.
Later we will fix all files that were created, to use better layout.
In first moment, the root path is protected, but should be accessible, update `home_controller.rb` to be public.

```ruby
class HomeController < ApplicationController
  allow_unauthenticated_access
  # ...
end
```

And the result that `tailwind` returns is accessible in `http://localhost:3000/session/new`

### Registration

Let's create the registrations controller and actions

```bash
bin/rails generate controller registrations new
```

Change in `routes.rb` the `registrations` resource

```ruby
resource :registrations, only: %i[create new]
```
