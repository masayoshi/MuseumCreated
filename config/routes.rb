# == Route Map (Updated 2013-01-04 18:03)
#
# articles GET /articles(.:format) articles#index
#     news     /news(.:format)     articles#index
#     root     /                   articles#index
#

MuseumCreated::Application.routes.draw do
  resources :articles, only: [:index]
  match "/news", to: "articles#index"
  root to: "articles#index"
end
