<img width="1037" alt="Turnip the Beet Home Page" src="https://files.slack.com/files-pri/T029P2S9M-FU9HWN4JE/image.png">

# Turnip the Beet
Turnip the Beet is a mod 3 group project that allows a user to input their cuisine and mood for an event and returns a set of curated Spotify playlists. It uses the Spotify API/OAuth to authenticate users with a microservice built in Sinatra on the back end. Our unique mapping algorithms ensure the user is provided with the best playlists Spotify has to offer and guarantees a fun musical experience. It will guac your world!

## Group members
- Jomah Fangonilo: https://github.com/jfangonilo
- Jordan Holtkamp: https://github.com/jordanholtkamp
- Linda Le: https://github.com/linda-le1/
- Melissa Robbins: https://github.com/mel-rob

<img width="1037" alt="Turnip the Beet Playlists" src="https://files.slack.com/files-pri/T029P2S9M-FUNC9TPTP/image.png">

## Production Link
https://turnip-the-beet.herokuapp.com/

## Instructions to Deploy
First, clone the directory to a local repository:
`git clone https://github.com/linda-le1/turnip-the-beet`
Then, navigate into the project from your terminal:
`cd turnip-the-beet`
This project does make use of several gems (see details for more information below) that needs to be bundled:
`bundle install`
Get your database and tables created:
`rails db:create`
`rails db:migrate`

## Tech Stack
- Ruby on Rails
- Sinatra
- JavaScript
- RSpec
- Capybara
- Postgres

## Design Architecture
<img width="900" alt="Design Architecture" src="https://user-images.githubusercontent.com/46657526/74778886-63218500-5294-11ea-81fb-7e336dd73ba6.jpg">

## Future Iterations
- Incorporation of a recipe API to generate reccommended recipes to go along with playlists.
- Natural Language Processing to parse through a recipe and return playlists based on results.
- Ability to share playlists and cuisines on social media; invite friends to use the app.