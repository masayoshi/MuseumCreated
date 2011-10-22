MuseumCreated::Application.routes.draw do

  resources :projects do
    member do
      post :add_comment
      get :del_comment
    end
  end

  resources :feeds
  resources :works
  resources :offers do
    collection do
      get :check
    end
    member do
      get :accept, :reject
    end
  end

  match "/artists", :to => "artists#index"
  match "/artists/:username", :to => "artists#show"
  match "/artists/:username/works", :to => "works#index", :as => "artist_works"

  get "/settings/profile"
  put "/settings/update"

  devise_for :users do
    match "/settings/account", :to => "devise/registrations#edit"
  end
  
  match "/about", :to => "pages#about"
  match "/policy", :to => "pages#policy"
  match "/copyright", :to => "pages#copyright"
  match "/search", :to => "pages#search"

  root :to => "pages#home"
  
end
