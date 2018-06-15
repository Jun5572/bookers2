Rails.application.routes.draw do
  get '/top' => 'blogs#top'
  resources :blogs

  root 'blogs#top'
end
