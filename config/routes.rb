MuseumCreated::Application.routes.draw do

  resources :articles, only: [:index, :show]
  match "/news", :to => "articles#index"

  #resources :projects do
    #member do
      #post :add_comment
      #get :del_comment
    #end
  #end

  # resources :feeds
  resources :works
  #resources :offers do
    #collection do
      #get :check
    #end
    #member do
      #get :accept, :reject
    #end
  #end

  resources :locations
  resources :events

  match "/artists", :to => "artists#index"
  match "/artists/:username", :to => "artists#show"
  match "/artists/:username/works", :to => "works#index", :as => "artist_works"
  match "/artists/:username/events", :to => "events#index", :as => "artist_events"

  get "/settings/profile"
  put "/settings/update"
  match "/settings/services" => "services#index"
  match "/settings/locations" => "locations#new"

  devise_for :users, :controllers => { :registrations =>'registrations' }   do
    match "/settings/account", :to => "devise/registrations#edit"
  end

  match '/auth/:provider/callback' => 'services#create'
  resources :services, :only => [:index, :create, :destroy]

  #devise_for :users do
  #  match "/settings/account", :to => "devise/registrations#edit"
  #end

  match "/about", :to => "pages#about"
  match "/policy", :to => "pages#policy"
  match "/copyright", :to => "pages#copyright"
  match "/search", :to => "pages#search"
  match "/help", :to => "pages#help"

  root :to => "pages#home"

end
#== Route Map
# Generated on 26 Feb 2012 13:14
#
#                  article GET    /articles/:id(.:format)             articles#show
#      add_comment_project POST   /projects/:id/add_comment(.:format) projects#add_comment
#      del_comment_project GET    /projects/:id/del_comment(.:format) projects#del_comment
#                 projects GET    /projects(.:format)                 projects#index
#                          POST   /projects(.:format)                 projects#create
#              new_project GET    /projects/new(.:format)             projects#new
#             edit_project GET    /projects/:id/edit(.:format)        projects#edit
#                  project GET    /projects/:id(.:format)             projects#show
#                          PUT    /projects/:id(.:format)             projects#update
#                          DELETE /projects/:id(.:format)             projects#destroy
#                    works GET    /works(.:format)                    works#index
#                          POST   /works(.:format)                    works#create
#                 new_work GET    /works/new(.:format)                works#new
#                edit_work GET    /works/:id/edit(.:format)           works#edit
#                     work GET    /works/:id(.:format)                works#show
#                          PUT    /works/:id(.:format)                works#update
#                          DELETE /works/:id(.:format)                works#destroy
#             check_offers GET    /offers/check(.:format)             offers#check
#             accept_offer GET    /offers/:id/accept(.:format)        offers#accept
#             reject_offer GET    /offers/:id/reject(.:format)        offers#reject
#                   offers GET    /offers(.:format)                   offers#index
#                          POST   /offers(.:format)                   offers#create
#                new_offer GET    /offers/new(.:format)               offers#new
#               edit_offer GET    /offers/:id/edit(.:format)          offers#edit
#                    offer GET    /offers/:id(.:format)               offers#show
#                          PUT    /offers/:id(.:format)               offers#update
#                          DELETE /offers/:id(.:format)               offers#destroy
#                  artists        /artists(.:format)                  artists#index
#                                 /artists/:username(.:format)        artists#show
#             artist_works        /artists/:username/works(.:format)  works#index
#         settings_profile GET    /settings/profile(.:format)         settings#profile
#          settings_update PUT    /settings/update(.:format)          settings#update
#        settings_services        /settings/services(.:format)        services#index
#         settings_account        /settings/account(.:format)         devise/registrations#edit
#         new_user_session GET    /users/sign_in(.:format)            devise/sessions#new
#             user_session POST   /users/sign_in(.:format)            devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)           devise/sessions#destroy
#            user_password POST   /users/password(.:format)           devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)       devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)      devise/passwords#edit
#                          PUT    /users/password(.:format)           devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)             registrations#cancel
#        user_registration POST   /users(.:format)                    registrations#create
#    new_user_registration GET    /users/sign_up(.:format)            registrations#new
#   edit_user_registration GET    /users/edit(.:format)               registrations#edit
#                          PUT    /users(.:format)                    registrations#update
#                          DELETE /users(.:format)                    registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)       devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)   devise/confirmations#new
#                          GET    /users/confirmation(.:format)       devise/confirmations#show
#                                 /auth/:provider/callback(.:format)  services#create
#                 services GET    /services(.:format)                 services#index
#                          POST   /services(.:format)                 services#create
#                  service DELETE /services/:id(.:format)             services#destroy
#                    about        /about(.:format)                    pages#about
#                   policy        /policy(.:format)                   pages#policy
#                copyright        /copyright(.:format)                pages#copyright
#                   search        /search(.:format)                   pages#search
#                     help        /help(.:format)                     pages#help
#                     root        /                                   pages#home
#                 contacts POST   /contacts(.:format)                 contact_us/contacts#create
#              new_contact GET    /contacts/new(.:format)             contact_us/contacts#new
#               contact_us        /contact_us(.:format)               contact_us/contacts#new
