Rock::Application.routes.draw do
  devise_for :users
  namespace 'admin' do
    root :to => "index#index"
    resources :page_categories, :except => [:new, :show, :edit]
    resources :sider_types, :except => [:new, :show, :edit]
    resources :siders, :except => :show
  end
  
  root :to => "static_pages#index"
  match "*url_match" => "static_pages#show"
end
