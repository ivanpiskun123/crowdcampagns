Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'}

  resources :campaigns do
    resources :comments, shallow: true
  end

  root 'home#news'

  # get '/confirm/:usname', to: 'home#confirm_page', as: 'confirm_page'
  get 'confirm_wait', to: 'home#confirm_wait'
  get 'top_rated_campaigns', to: 'home#top_rated_campaigns'
  get 'all_campaign', to: 'campaigns#index'

  get 'current_user_camp', to: 'profiles#index_campaigns'



end
