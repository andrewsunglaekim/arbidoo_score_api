class ScoresController < ApplicationController
   before_action :get_high_scores, only: [:high_score, :create]
  def index
		@scores = Score.all
    render json: @scores
  end

  def high_score
	  @data = {
      leaderBoard: @scores
		}
    render json: @data
  end

  def create
    @score = Score.create!(score_params)
		@data = {
		  score: @score,
			leaderBoard: @scores
		}
    render json: @data
  end

  private
  def score_params
   params.require(:score).permit(:username, :score, :maxNum, :operator, :time)
  end
	
	def get_high_scores
	  if params[:score].class.to_s == "String"
	    score = JSON.parse(params[:score])["maxNum"]
		else
			score = params[:score]["maxNum"]
	  end
    @scores = Score.where(maxNum: score).order(score: :desc, time: :asc).limit(5)
	end
end
