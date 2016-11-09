class ScoresController < ApplicationController
  def index
		@scores = Score.all
    render json: @scores
  end

  def high_score
    @scores = Score.where(maxNum: params[:score]).order(score: :desc, time: :asc).limit(5)
    render json: @scores
  end

  def create
    @score = Score.create!(score_params)
    render json: @score
  end

  private
  def score_params
   params.require(:score).permit(:username, :score, :maxNum, :operator, :time)
  end

end
