MuseumCreated::Application.routes.draw do

  devise_for :users

  match "/about", :to => "pages#about"
  match "/policy", :to => "pages#policy"
  match "/copyright", :to => "pages#copyright"
  match "/contact", :to => "pages#contact"

  root :to => "pages#home"
  
end
