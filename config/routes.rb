Rails.application.routes.draw do
    resources :posts

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  root to: "posts#index"



end
