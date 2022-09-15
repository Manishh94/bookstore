# README

* Ruby version -> ruby-2.7.1

* Post cloning the repo.
After Cloning make sure to rename and change the content of `config/application.yml` file This contents all the env variables required to run the application.

We want to run our scheduler for which we will create a systemd service file which will run the job in background all the time.

* When user want to seed data into database manually they need to run `bundle exec sidekiq -C config/sidekiq.yml` 
This file already have the cron scheduled which will run every min. 

Basic associations are in models. If you want to see the database structure please visit `public/db_schema.png` file.

