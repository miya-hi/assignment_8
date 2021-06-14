Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
