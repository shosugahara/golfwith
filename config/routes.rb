Rails.application.routes.draw do
  post   '/pay',   to: 'pay#index'
  get 'howtouse/index'

  get 'golfcourse/index'

  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }
  get 'notifications', to: 'notifications#index'

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

  root 'tops#index'

  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  resources :users

  resources 'lessons'

  resources 'comments'
  if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
