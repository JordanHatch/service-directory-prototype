Rails.application.routes.draw do
  resources :services, except: :destroy do
    resources :items, except: :show
  end

  root to: redirect('/services')
end
