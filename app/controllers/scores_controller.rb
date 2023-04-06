class ScoresController < ApplicationController
  before_action :set_movie
  before_action :set_score, only: [:destroy]

  # POST /movies/:movie_id/scores
  def create
    @score = @movie.scores.new(score_params)

    if @score.save
      render json: @score, status: :created
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/:movie_id/scores/:id
  def destroy
    @score.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_score
    @score = @movie.scores.find(params[:score_id])
  end

  # Only allow a trusted parameter "white list" through.
  def score_params
    params.require(:score).permit(:score, :user_id)
  end
end
