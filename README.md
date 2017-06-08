# WZND Rails Request Log
---

## Purpose
The WZND Rails Request Log is a simple solution to an arduous task form my friends at [103.3 WZND LP-FM](http://wznd.com/). 

At WZND, whenever a listener makes a request, the DJ must write down the request information (song requested, artist of the song, ect..) on a paper spreadsheet. At the end of each month, someone goes through all of the requests by hand and creates analytics that can be used to make music decisions for the station. 

With the Rails Request Log, DJs can now simply input request information in a web form, which is then stored in a database, and analytics are automatically generated.

## Dependencies
To run this web app on your own, it is required that you have [rails](https://github.com/rails/rails) and [bundler](https://github.com/bundler/bundler) installed. 

To install them, run the following commands in your terminal:

`$ gem install rails`

`$ gem install bundler`

## Getting Started
1. Clone this repository to your local computer
    
    `$ git clone https://github.com/MikeyB303/rails-request-log`

2. Navigate to the newly cloned repo.
    
    `$ cd wherever-you-cloned-the-repo-to/rails-request-log`

3. Install dependencies using bundler.
    
    `$ bundle install`

4. Create and migrate your database

  `rails db:create`
  `rails db:migrate`
  `rails db:seed` (NOTE: it is not necessary to seed, however you will need at least one user model to log in and use the app)

5. Start a local rails server.
    
    `$ rails server` or `$ rails s`

6. In your web browser, navigate to [localhost:3000](localhost:3000) to view the app.


## Contributing and Using
If you'd like to contribute to the WZND Rails Request Log, simply fork this repo, make your desired changes, and create a pull request for us to review. If all is good, I'll accept your changes.

If you'd like to use this app for your radio station, feel free to fork it and change all mentions of WZND to your stations call letters.