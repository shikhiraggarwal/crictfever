Rails.application.routes.draw do
  root to: 'pages#home'
  get 'terms/index'
  get 'terms/fixtures'
  get 'terms/standings'
  get 'terms/teams'
  get 'bets/index'
  post 'bets/place'
  get 'players/profile'
  get 'players/new'
  get 'players/edit'
  post 'players/update'
  get 'prizes/index'
  get 'prizes/get_bettable_game'
  get 'prizes/get_current_game'
  get 'prizes/adreward'
  get 'ranks/index'
  devise_for :supers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
