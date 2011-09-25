MuseumCreated::Application.routes.draw do

  match "/artists", :to => "artists#index"
  match "/artists/:username", :to => "artists#show"

  get "/settings/profile"
  put "/settings/update"

  devise_for :users do
    match "/settings/account", :to => "devise/registrations#edit"
  end
  
  match "/about", :to => "pages#about"
  match "/policy", :to => "pages#policy"
  match "/copyright", :to => "pages#copyright"
  match "/contact", :to => "pages#contact"
  match "/search", :to => "pages#search"

  root :to => "pages#home"
  
end
