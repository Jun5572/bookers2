Rails.application.routes.draw do
  get '/top' => 'blogs#top'
  resources :blogs
end
