Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    get :upvote,    on: :member #upvote доступен каждому товару
    get :expensive, on: :collection #collection доступен всем товарам
  end

end
