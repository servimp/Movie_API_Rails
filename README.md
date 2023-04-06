# Movies API

This is a simple RESTful API for managing movies and their associated genres.

## API Endpoints

### Movies

- `GET /movies`: returns a list of all movies
- `GET /movies/:id`: returns a specific movie by ID
- `POST /movies`: creates a new movie
- `PUT /movies/:id`: updates an existing movie by ID
- `DELETE /movies/:id`: deletes a movie by ID

### Genres

- `GET /genres`: returns a list of all genres
- `GET /genres/:id`: returns a specific genre by ID
- `POST /genres`: creates a new genre
- `PUT /genres/:id`: updates an existing genre by ID
- `DELETE /genres/:id`: deletes a genre by ID

## Specs

The API has been tested using RSpec. All tests are located in the `/spec` directory.

## ERD Diagram

+---------+          +-------------------+         +-----------+  
|  Genre  |          |       Movie       |         |   Score   |  
+---------+          +-------------------+         +-----------+  
| id      |◇--------| id                |         | id        |  
| name    |          | name              |---------| value     |  
+---------+          | preview_video_url |◇-------| movie_id  |  
                     | runtime           |         | user_id   |◇-----| id |  
                     | synopsis          |         +-----------+  
                     | avg_score         |  
                     +-------------------+  
## Running the Application

To run the application locally, follow these steps:

1. Clone the repository:

git clone https://github.com/servimp/Movie_API_Rails.git

2. Install the dependencies:

bundle install

3. Set up the database:

rails db:create db:migrate

4. Start the server:

rails s

5. The API is now running on `http://localhost:3000`.
