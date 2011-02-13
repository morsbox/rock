Rock::Application.routes.draw do
  devise_for :users

  root :to => "static_pages#index"
  match "*url_match" => "static_pages#show"
end
