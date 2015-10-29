Preserve your most precious memories with Moment! This micro-diary platform will allow users to document their moments in specific journals - because the days are long, but the years are short.

*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~

See Moment on Heroku at: 
http://years-are-short.herokuapp.com/

Technologies used:
Ruby on Rails, PostgreSQL, jQuery

Gems installed:
Devise (user auth)
Bootstrap (styling)
Friendly_ID (URL prettification for journals)
Kaminari (pagination)

To install this locally, first clone the repo, then bundle install. Run rake db: create then rake db: migrate. If you want to populate the database with example users and journals, run rake db:seed. (The password for all example users is 'password'. Example users do not have profile pictures, but you can update their profiles to include one if you so choose.)

Once a user signs up or logs in, they are taken to their profile page. On this page, they can create new journals. When a user clicks on the title of an individual journal, it takes them to the journal's page, where they can add new moments. Users can also upload a photo for each moment from their own computer, Facebook, Instagram, or Google Drive. 

Users can make individual moments sharable at the point of creation or when they're editing the moment by selecting the checkbox. When a moment is sharable, the user sees a link to a page with only the selected moment showing. This moment is available to view for anyone with the URL. If the person viewing the moment is not signed in to Moment, they are given a link to learn more about the service. 

*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~

In future versions of the service, users will be able to share individual moments via Twitter and Facebook. They will also be able to log in with either service.  