Rails.application.routes.draw do
  devise_for :users

  resources :boards
  
  resources :pins do
    member do
      post '/repost' => 'pins#repost'
    end

    member do
      post '/like' => 'pins#like'
    end
  end

  get ':username' => 'users#show', as: 'user'

  root 'welcome#index'
end
