Rails.application.routes.draw do
 

  get 'page/question'
  get 'page/news'
  resources :users
  resources :line_items
  resources :carts
  resources :products

  get 'access/new'
  get 'access/create'
  get 'access/destroy'


  get 'admin/index'
  get 'admin', to: 'admin#index', as: 'admin'
  get 'login', to: 'access#new', as: 'login'
  post 'access/new', to: 'access#create'
  delete 'logout', to: 'access#destroy', as: 'logout'

  resources :orders


  get 'shopper', to: 'shopper#index', as: 'root'  #把 /shopper 当做 /
  get 'shopper/index', to: 'shopper#index'
  get 'shopper/:id', to: 'shopper#show', as:'showshopper'
  
  root "shopper#index", as: 'shopper'

  
  
  get 'search', to: 'search#index', as: 'search'



  get 'page/contact', to: 'page#contact', as: 'contact'
  get 'page/news', to: 'page#news', as: 'news'
  get 'page/questions', to: 'page#questions', as: 'questions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #for any non-existing url routes
  get '*unmatched_route', to: 'errors#error_404', via: :all
  

end
