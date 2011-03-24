Rock::Application.routes.draw do
  devise_for :users
  namespace 'admin' do
    root :to => "index#index"  
  end
  
  root :to => "static_pages#index"
  match "*url_match" => "static_pages#show"
end
