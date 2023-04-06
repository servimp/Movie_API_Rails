require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  let!(:movies) { create_list(:movie, 5) }
  let(:movie_id) { movies.first.id }

  describe "GET /movies" do
    before { get '/movies' }

    it "returns movies" do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /movies/:id" do
    before { get "/movies/#{movie_id}" }

    context "when the movie exists" do
      it "returns the movie" do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(movie_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the movie does not exist" do
      let(:movie_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Movie not found/)
      end
    end
  end

  describe "POST /movies" do
    let(:valid_attributes) { { name: "The Matrix", preview_video_url: "http://www.example.com/video.mp4", runtime: "2h 16m", synopsis: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", avg_score: 90 } }

    context "when the request is valid" do
      before { post '/movies', params: { movie: valid_attributes } }

      it "creates a movie" do
        expect(JSON.parse(response.body)['name']).to eq('The Matrix')
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post '/movies', params: { movie: { name: nil } } }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        error_response = JSON.parse(response.body)
      
        expect(error_response["name"]).to eq(["can't be blank"])
        expect(error_response["preview_video_url"]).to eq(["can't be blank"])
        expect(error_response["runtime"]).to eq(["can't be blank"])
        expect(error_response["synopsis"]).to eq(["can't be blank"])
        expect(error_response["avg_score"]).to eq(["is not a number"])
      end
      
    end
  end

  describe "PUT /movies/:id" do
    let(:valid_attributes) { { name: "The Matrix Reloaded" } }

    context "when the movie exists" do
      before { put "/movies/#{movie_id}", params: { movie: valid_attributes } }

      it "updates the movie" do
        updated_movie = JSON.parse(response.body)
        expect(updated_movie['name']).to eq('The Matrix Reloaded')
      end
      

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
      

      describe "DELETE /movies/:id" do
        before { delete "/movies/#{movie_id}" }

        it "returns status code 204" do
          expect(response).to have_http_status(204)
        end
      end
    end

    context "when the movie does not exist" do
      let(:movie_id) { 100 }

      before { get "/movies/#{movie_id}", params: { movie: valid_attributes } }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Movie not found/)
      end
      
    end
  end
end
