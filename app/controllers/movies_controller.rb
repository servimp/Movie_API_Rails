class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.search(params[:movie_ids])

    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

# POST /movies
def create
  puts "movie_params: #{movie_params.inspect}"
  @movie = Movie.new(movie_params)
  puts "@movie before save: #{@movie.inspect}"
  
  if @movie.save
    puts "@movie after save: #{@movie.inspect}"
    render json: @movie, status: :created
  else
    render json: @movie.errors, status: :unprocessable_entity
  end
end


  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find_by(id: params[:id])
    unless @movie
      render json: { error: "Movie not found" }, status: :not_found
    end
  end
  

  # Only allow a trusted parameter "white list" through.
  def movie_params
    params.require(:movie).permit(:name, :preview_video_url, :runtime, :synopsis, :avg_score, genre_attributes: [:id, :name])
  end
end
