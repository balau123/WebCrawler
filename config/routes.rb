Rails.application.routes.draw do
resources :posts
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#root to: 'articles#index'
get '/'    => 'posts#craw'
get '/craw'    => 'posts#craw'
get '/'    => 'posts#craw'
get '/article'    => 'posts#article'
get '/posted'    => 'posts#posted'
get '/postedinfo/:id', to:  'posts#postedinfo', as: 'postedinfo'
get '/new'    => 'posts#new'
#get '/posts/new1', to: 'posts#new1', as: 'new1_post'
#get 'articles/new'
#get 'articles/create'


end
