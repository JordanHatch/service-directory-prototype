Rails.application.routes.draw do
  resources :services, except: [:edit, :destroy] do
    resources :items, except: :show
  end

  root to: redirect('/services')
end
