class ScoresController < ApplicationController
  def index
		@scores = Score.all
    render json: @scores
  end

  def high_score
    @scores = Score.where(maxNum: params[:score]).order(score: :desc, time: :asc)
    render json: @scores
  end

  def score
    binding.pry
  end
end
