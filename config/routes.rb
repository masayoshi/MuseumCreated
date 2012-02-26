MuseumCreated::Application.routes.draw do

  resources :projects do
    member do
      post :add_comment
      get :del_comment
    end
  end

  # resources :feeds
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
  match "/settings/services" => "services#index"

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
# Generated on 25 Dec 2011 16:22
#
#      del_comment_project GET    /projects/:id/del_comment(.:format) {:action=>"del_comment", :controller=>"projects"}
#                 projects GET    /projects(.:format)                 {:action=>"index", :controller=>"projects"}
#                          POST   /projects(.:format)                 {:action=>"create", :controller=>"projects"}
#              new_project GET    /projects/new(.:format)             {:action=>"new", :controller=>"projects"}
#             edit_project GET    /projects/:id/edit(.:format)        {:action=>"edit", :controller=>"projects"}
#                  project GET    /projects/:id(.:format)             {:action=>"show", :controller=>"projects"}
#                          PUT    /projects/:id(.:format)             {:action=>"update", :controller=>"projects"}
#                          DELETE /projects/:id(.:format)             {:action=>"destroy", :controller=>"projects"}
#                    feeds GET    /feeds(.:format)                    {:action=>"index", :controller=>"feeds"}
#                          POST   /feeds(.:format)                    {:action=>"create", :controller=>"feeds"}
#                 new_feed GET    /feeds/new(.:format)                {:action=>"new", :controller=>"feeds"}
#                edit_feed GET    /feeds/:id/edit(.:format)           {:action=>"edit", :controller=>"feeds"}
#                     feed GET    /feeds/:id(.:format)                {:action=>"show", :controller=>"feeds"}
#                          PUT    /feeds/:id(.:format)                {:action=>"update", :controller=>"feeds"}
#                          DELETE /feeds/:id(.:format)                {:action=>"destroy", :controller=>"feeds"}
#                    works GET    /works(.:format)                    {:action=>"index", :controller=>"works"}
#                          POST   /works(.:format)                    {:action=>"create", :controller=>"works"}
#                 new_work GET    /works/new(.:format)                {:action=>"new", :controller=>"works"}
#                edit_work GET    /works/:id/edit(.:format)           {:action=>"edit", :controller=>"works"}
#                     work GET    /works/:id(.:format)                {:action=>"show", :controller=>"works"}
#                          PUT    /works/:id(.:format)                {:action=>"update", :controller=>"works"}
#                          DELETE /works/:id(.:format)                {:action=>"destroy", :controller=>"works"}
#             check_offers GET    /offers/check(.:format)             {:action=>"check", :controller=>"offers"}
#             accept_offer GET    /offers/:id/accept(.:format)        {:action=>"accept", :controller=>"offers"}
#             reject_offer GET    /offers/:id/reject(.:format)        {:action=>"reject", :controller=>"offers"}
#                   offers GET    /offers(.:format)                   {:action=>"index", :controller=>"offers"}
#                          POST   /offers(.:format)                   {:action=>"create", :controller=>"offers"}
#                new_offer GET    /offers/new(.:format)               {:action=>"new", :controller=>"offers"}
#               edit_offer GET    /offers/:id/edit(.:format)          {:action=>"edit", :controller=>"offers"}
#                    offer GET    /offers/:id(.:format)               {:action=>"show", :controller=>"offers"}
#                          PUT    /offers/:id(.:format)               {:action=>"update", :controller=>"offers"}
#                          DELETE /offers/:id(.:format)               {:action=>"destroy", :controller=>"offers"}
#                  artists        /artists(.:format)                  {:controller=>"artists", :action=>"index"}
#                                 /artists/:username(.:format)        {:controller=>"artists", :action=>"show"}
#             artist_works        /artists/:username/works(.:format)  {:controller=>"works", :action=>"index"}
#         settings_profile GET    /settings/profile(.:format)         {:controller=>"settings", :action=>"profile"}
#          settings_update PUT    /settings/update(.:format)          {:controller=>"settings", :action=>"update"}
#         settings_account        /settings/account(.:format)         {:controller=>"devise/registrations", :action=>"edit"}
#         new_user_session GET    /users/sign_in(.:format)            {:action=>"new", :controller=>"devise/sessions"}
#             user_session POST   /users/sign_in(.:format)            {:action=>"create", :controller=>"devise/sessions"}
#     destroy_user_session DELETE /users/sign_out(.:format)           {:action=>"destroy", :controller=>"devise/sessions"}
#            user_password POST   /users/password(.:format)           {:action=>"create", :controller=>"devise/passwords"}
#        new_user_password GET    /users/password/new(.:format)       {:action=>"new", :controller=>"devise/passwords"}
#       edit_user_password GET    /users/password/edit(.:format)      {:action=>"edit", :controller=>"devise/passwords"}
#                          PUT    /users/password(.:format)           {:action=>"update", :controller=>"devise/passwords"}
# cancel_user_registration GET    /users/cancel(.:format)             {:action=>"cancel", :controller=>"registrations"}
#        user_registration POST   /users(.:format)                    {:action=>"create", :controller=>"registrations"}
#    new_user_registration GET    /users/sign_up(.:format)            {:action=>"new", :controller=>"registrations"}
#   edit_user_registration GET    /users/edit(.:format)               {:action=>"edit", :controller=>"registrations"}
#                          PUT    /users(.:format)                    {:action=>"update", :controller=>"registrations"}
#                          DELETE /users(.:format)                    {:action=>"destroy", :controller=>"registrations"}
#        user_confirmation POST   /users/confirmation(.:format)       {:action=>"create", :controller=>"devise/confirmations"}
#    new_user_confirmation GET    /users/confirmation/new(.:format)   {:action=>"new", :controller=>"devise/confirmations"}
#                          GET    /users/confirmation(.:format)       {:action=>"show", :controller=>"devise/confirmations"}
#                                 /auth/:provider/callback(.:format)  {:controller=>"services", :action=>"create"}
#                 services GET    /services(.:format)                 {:action=>"index", :controller=>"services"}
#                          POST   /services(.:format)                 {:action=>"create", :controller=>"services"}
#                  service DELETE /services/:id(.:format)             {:action=>"destroy", :controller=>"services"}
#                    about        /about(.:format)                    {:controller=>"pages", :action=>"about"}
#                   policy        /policy(.:format)                   {:controller=>"pages", :action=>"policy"}
#                copyright        /copyright(.:format)                {:controller=>"pages", :action=>"copyright"}
#                   search        /search(.:format)                   {:controller=>"pages", :action=>"search"}
#                     help        /help(.:format)                     {:controller=>"pages", :action=>"help"}
#                     root        /                                   {:controller=>"pages", :action=>"home"}
#                 contacts POST   /contacts(.:format)                 {:action=>"create", :controller=>"contact_us/contacts"}
#              new_contact GET    /contacts/new(.:format)             {:action=>"new", :controller=>"contact_us/contacts"}
#               contact_us        /contact_us(.:format)               {:action=>"new", :controller=>"contact_us/contacts"}
