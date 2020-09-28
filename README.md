# Zype code challenge by Gonzo Ghanem - README

## Challenge

Architect and code a Ruby on Rails app that displays a list of videos from the Zype API.

Each video should show:
* Video thumbnail
* Video title
* Allows a user to click on the video thumbnail/title to view video details.
* On video details screen render the video player if user is subscribed or if video is free to play
* If user is guest and video needs subscription, take user to login page
* If user is logged in and video needs subscription, check entitlement before giving access to the video player

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
5. setup environment variable `ZYPE_API_APP_KEY=your_app_key`
5. setup environment variable `ZYPE_API_CLIENT_ID=your_client_id`
5. setup environment variable `ZYPE_API_CLIENT_SECRET=your_client_secret`
6. run the application with default settigns `bundle exec rails s`

## High level architecture overview

This is a very simple Rails 5 application that connects to Zype's API to retrieve a list of videos and render a player for selected videos. Also provides Oauth mechanism through Zype's Oauth API.

> NOTE: Since models support was not needed, at least for now, every ActiveRecord dependency and configuration was commented out so there's no database configuration needed for this app to run.

Some important notes on the implementation:

* **app/lib/zype_api**: this folder holds all the code used to connect to Zype APIs and parse the services responses.
* **app/lib/zype_api/services**: collection of services defined to consume Zype APIs. Includes error handling and Zype models creation using the APIs responses data.
* **app/lib/zype_api/models**: collection of models that represent the resources returned by the various Zype APIs used in this application.
* **ApplicationController#current_user**: this helper method encapsulates the logic to retrieve the current user oauth status and refreshes the token each time.
* **session cookie**: configured to expire in 2 weeks after created. This cookie will hold the user session through the site.

## TODO

* Add spec coverage!!

