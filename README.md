# INDIE CAMPIERS API

This project was built with the following stack

ruby 2.6.0p0 (2018-12-25 revision 66547)

rails 5.2.2

## Installation

Clone the project

And then execute:

    $ bundle install

    $ rails db:drop db:migrate db:migrate db:seed

## How to use - Step by Step

1- Creating Highlights

Start by creating more Highlights(if you want to). 

  For that you should do:
  ```ruby
    Highlight.create(name: FILL_IN)
  ```
2 - Using the built in Geocoder

Incase you want to check the coordinates

  You should do:
   ```ruby
    Geocoder.search(FILL_IN)
  ```

3 - URL Endpoints

To check all the highlights from point A to point B, type in the following URL

    http://localhost:3000/routes?start_point=FILL_IN&end_point=FILL_IN # The following example assumes a 20km radius default

Example:

    http://localhost:3000/routes?start_point=Faro,pt&end_point=Porto

In case you wanna specify a specific radius do:

    http://localhost:3000/routes?start_point=Faro,pt&end_point=Porto&radius=40


To check the closest highlight to a given set of coordinates you should do:

    http://localhost:3000/highlights?lat=FILL_IN&lon=FILL_IN

Example:

    http://localhost:3000/highlights?lat=37.0193548&lon=-7.9304397

4 - Todo

    In this exercise there aren't validations for the URL params. But in a production env they should be made in order to assure that the user inserts coordinates for the closest highlight and locations(non coordinates) for routes.

And that's pretty much it