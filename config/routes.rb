Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers		#Сделали вложенный ресурс чтобы у answer был доступен question
  end

  root to: "questions#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
