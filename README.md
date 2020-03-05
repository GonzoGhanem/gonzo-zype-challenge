# Zype code challenge by Gonzo Ghanem - README

## Challenge

Architect and code a Ruby on Rails app that displays a list of videos from the Zype API.

Each video should show:
* Video thumbnail
* Video title
* Allows a user to click on the video thumbnail/title to view video details.
* On video details screen render the video player

## Heroku live app

https://gonzo-zype-challenge.herokuapp.com/

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

## High level architecture overview

This is a very simple Rails 5 application that connects to Zype's API to retrieve a list of videos and render a player for selected videos.

Since models support was not needed, at least for now, every ActiveRecord dependency and configuration was commented out so there's no database configuration needed for this app to run.

There are three models though, with no database setup, used to represent the JSON objects returned by the API to avoid exposing that structure to the front end:

1. [SearchResult](https://github.com/GonzoGhanem/gonzo-zype-challenge/blob/master/app/models/search_result.rb)
2. [Pagination](https://github.com/GonzoGhanem/gonzo-zype-challenge/blob/master/app/models/pagination.rb)
3. [Video](https://github.com/GonzoGhanem/gonzo-zype-challenge/blob/master/app/models/video.rb)

Then most of the work is done by the [ZypeApi helper module](https://github.com/GonzoGhanem/gonzo-zype-challenge/blob/master/app/helpers/zype_api.rb). This helper was created to expose some of the API's characteristics. Could be replaced by a gem or similar if there's one created in the future.

The helper exposes two methods: **videos_page** and **video_details** and encapsulates all the logic needed to call the API such as URLs and API key needed to authenticate against it.

The controller and views are really simple, it's just looping/rendering the models returned by the ZypeAPI Helper.


