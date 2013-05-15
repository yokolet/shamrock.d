## "Datomic, from Ruby, from Rails," RailsConf 2013 Slide

This repository has the slide code I used at RailsConf 2013 presentation.
My slide was a working example of JRuby on Rails, Datomic backend.
I used diametric gem for my slide app.

To run this app, follow the instruction below:

1. Get ready to use JRuby.

2. Clone out my slide app
   ```bash
   $ git clone git@github.com:yokolet/shamrock.d.git
   ```

3. Bundle install (use JRuby!)

   ```bash
   $ bundle install
   ```

4. Edit Datomic free transactor's configuration

   file: `shamrock.d/vendor/config/free-transactor-template.properties`
   ```java
   data-dir=<rails root>/vendor/db
   log-dir=<rails root>/vendor/log
   pid-dir=<rails root>/vendor/log/free-transactor.pid
   ```
   *<rails root> is a full path to shamrock.d including "shamrock.d"

5. Start Datomic free transactor

   Assuming you have Datomic free version downloaded and unzipped,
   `cd` to unzipped directory.
   ```bash
   $ bin/transactor <rails root>/vendor/config//free-transactor-template.properties
   ```

6. Start Rails

   ```bash
   $ bundle exec rails s
   ```

   At the very first time, it takes very long time. Datomic will be downloaded under the gem directory.


7. Go to http://localhost:3000/slideshow

    Right/Left arrows, buttons under the slide navigates you.

    Optionally, you may http://localhost:3000/pages , and reload the app.
    This is a slide editing page. Not very nice interface, but works.
