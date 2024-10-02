# Course of Ruby on Rails 8 and Native Hotwire

Unlock the power of Ruby on Rails 8 and build modern web applications with ease! In this course, you'll master the essentials of Rails combined with the sleek styling of Tailwind and the dynamic capabilities of Stimulus components. But we’re not stopping there. You’ll also dive into the exciting world of Hotwire Native, where you’ll learn how to extend your applications seamlessly to mobile platforms. Whether you're aiming for web or mobile, this course will equip you with the skills to build responsive, interactive apps from scratch!

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
- System of localization and alerts
- Triggers to dispatch actions and alerts
- Testing

### Registration and Authorization

Until now, when we try create the full authentication, since we use by default tailwind, the generator will try to create the .erb files using him, but they don't exists. So, tailwind-css gem isn't with main branch until now, you need set in `Gemfile` using this branch with:

```Gemfile
gem "tailwindcss-rails", github: "rails/tailwindcss-rails", branch: "main"
```

And after just run:

```bash
bundle update
bin/rails generate authentication
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


```bash
bin/importmap pin @stimulus-components/character-counter
```
