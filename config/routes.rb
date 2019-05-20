Rails.application.routes.draw do
  get 'players/profile'
  get 'players/new'
  get 'players/edit'
  post 'players/update'
  get 'prizes/index'
  get 'prizes/adreward'
  get 'ranks/index'
  devise_for :supers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
