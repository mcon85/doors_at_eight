# Doors At Eight
![Build Status](https://codeship.com/projects/9eab13e0-2503-0134-e487-0e3391f87f23/status?branch=master)
![Code Climate](https://codeclimate.com/github/mcon85/doors_at_eight.png)
![Coverage Status](https://coveralls.io/repos/mcon85/doors_at_eight/badge.png)


Doors at Eight is a review app for the Boston live music scene. Users review their favorite venues and rate each other's reviews, building a broader picture of the best places to hear music in Boston.


## Contributors

[Arber Theodhor](https://github.com/arbertheo), [Hannah Read](https://github.com/freyjasdottir), [Maggie Concannon](https://github.com/mcon85), [Nick Vanselow](https://github.com/nvanselow), and [Serge Pokrovskii](https://github.com/spokrovskiy)

## Production Site

[Doors At Eight] on Heroku (https://doors-at-eight.herokuapp.com/)


## Features

* The ability to add a venue to be reviewed.
* The ability to write a review.
* The ability to rate a venue.
* The ability to upvote or downvote a review. (Ajax allows us to see the result without reloading a page)
* A sign up and authentication system for users that allows to distinguish users and privileges that they have.
* The ability to reset the password by generating an email to the user.
* The ability to upload a profile photo (with CarrierWave).
* The ability to search for items.
* It has an Admin role. Admins are able to delete reviews or items if they are deemed to be inappropriate.
* The ability to send  emails. Email is sent to the owner of a venue when a new review is posted about it.



## Modules

It was build using next technologies:

* [Ruby](https://www.ruby-lang.org/en/)
* [RubyOnRails](http://rubyonrails.org/)
* [React](https://facebook.github.io/react/docs/getting-started.html)
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
* Authentication using [Devise](https://github.com/plataformatec/devise)
* Database using [Postgres sql](https://www.postgresql.org)
* Flexible Pub/Sub Messaging using [Pusher API](https://pusher.com/)
* Uploading profile photos [CarrierWave](https://github.com/carrierwaveuploader/carrierwave.git)
* Searching data base [Postgres pg gem](https://rubygems.org/gems/pg/versions/0.18.4)
* [ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html)
* Posting  tweets [Twitter API](https://dev.twitter.com/rest/public)


## Installation

Run:
git clone https://github.com/mcon85/doors_at_eight.git


Install web kit. Read about it [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)  

bundle install

Get your pusher keys from [here](https://pusher.com/)
Set up pusher keys at .env
example:

```sh
PUSHER_APP_ID="pusher_id_here"
PUSHER_KEY="pusher_key_here"
PUSHER_SECRET_KEY="pusher_secret_key_here"
```
