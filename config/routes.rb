Rails.application.routes.draw do

  get 'post_comments/create'
  get 'post_comments/index'
 	get 'favorites/create'
 	get 'favorites/destroy'
# get 'root/top'
	devise_for :users
# devise_scope :user do
# get '/users/sign_out' => 'devise/sessions#destroy'
# end
 	get '/top' => 'blogs#top'
 	get '/about' => 'root#top'

 	# ネスト
  	resources :blogs do
  		resource :favorites, only:[:create, :destroy]
      resources :post_comments, only:[:create, :index, :destroy]
  		post 'favorites2/' => 'favorites#create_favorite'
  		delete 'favorites2/' => 'favorites#destroy_favorite'
  	end

	resources :users, only:[:top, :index, :create, :update, :show, :edit, :destroy]

# ログイン認証が成功したあとに飛ぶページのルーティング
  	root 'blogs#top'

end