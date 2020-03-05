# Zype code challenge by Gonzo Ghanem - README

## Challenge

Architect and code a Ruby on Rails app that displays a list of videos from the Zype API.

Each video should show:
* Video thumbnail
* Video title
* Allows a user to click on the video thumbnail/title to view video details.
* On video details screen render the video player

## Technologies

* Ruby 2.4.4
* Rails 5.2.1
* Zype API docs: https://docs.zype.com/v1.0/reference
* Database N/A

## To run the application

1. Clone the repo from https://github.com/GonzoGhanem/gonzo-zype-challenge
2. Install Ruby 2.4.4
3. Install bundler 2.0.X
4. run `bundle install`
5. setup environment variable `ZYPE_API_KEY=your_zype_api_key`
6. run the application with default settigns `bundle exec rails s`