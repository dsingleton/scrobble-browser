# Scrobble Browser [![Build Status](https://travis-ci.org/dsingleton/scrobble-browser.svg)](https://travis-ci.org/dsingleton/scrobble-browser)

Last.fm allows you to [export your scrobbling history](https://secure.last.fm/settings/dataexporter), but you can't do much with them on their own.

This is a rails app that can import that data and provide an interface to explore it

## Running

Install dependencies with `bundle install` and run with `bundle exec rails server`.

It comes with some example data, which you can load with `rake db:fixtures:load`

## Importing Scrobbles

First, [export your scrobbling history](https://secure.last.fm/settings/dataexporter), extract the download and find `data/scrobbles.tsv`.

To import that data into the application run:

```bundle exec rake import:from_tsv USERNAME=yourusername PATH=/path/to/scrobbles.tsv```
