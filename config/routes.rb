Rails.application.routes.draw do
  require 'sidekiq/web'
  # require 'sidekiq/cron/web'

  root to: 'pages#home'

  # authenticate :user, ->(u) { u.komin_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  # end
  resources :tickets, only: %i[] do
    resources :votes, only: %i[create]
  end
end
