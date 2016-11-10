Rails.applicatio.routes.draw do
	get 'highscores', to: "scores#high_score"
	post 'highscore', to: "scores#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
