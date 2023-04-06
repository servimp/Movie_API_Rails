# Movies API

RESTful API for managing movies and their associated genres.

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

![alt text](https://github.com/servimp/Movie_API_Rails/blob/main/diagram.png?raw=true)

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

## Testing

To test the APP

1. `rails db:seed`

2. `rspec spec/requests/movies_spec.rb`
