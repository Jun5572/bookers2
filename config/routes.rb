Rails.application.routes.draw do
<<<<<<< HEAD



  # get 'root/top'
	devise_for :users
	# devise_scope :user do
 #    	get '/users/sign_out' => 'devise/sessions#destroy'
 #  	end
 	get '/top' => 'blogs#top'
 	get '/about' => 'root#top'
  	resources :blogs
	resources :users, only:[:top, :index, :create, :update, :show, :edit]

  # ログイン認証が成功したあとに飛ぶページのルーティング
  	root 'blogs#top'
=======
  get '/top' => 'blogs#top'
  resources :blogs

  root 'blogs#top'
>>>>>>> 2537fef22d5c4267c142d59d582ad4c44fd25162
end
