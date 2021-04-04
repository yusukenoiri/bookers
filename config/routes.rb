Rails.application.routes.draw do
  get 'homes/top'
resources :books
root :to => 'homes#top'
# rootパスで（/）でhomesのtopページに遷移できるよう設定
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
