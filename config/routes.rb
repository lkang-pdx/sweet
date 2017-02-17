Rails.application.routes.draw do
  devise_for :users

  resources :pins do
    member do
      post '/repost' => 'pins#repost'
    end
  end

  get ':username' => 'users#show', as: 'user'

  root 'welcome#index'
end
