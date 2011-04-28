Rock::Application.routes.draw do
  devise_for :users
  namespace 'admin' do
    root :to => "index#index"
    resources :page_categories, :except => [:new, :show, :edit]
    resources :sider_types, :except => [:new, :show, :edit]
    resources :siders, :except => :show
    resources :static_pages, :except => :show
  end
  
  root :to => "static_pages#index"
  ActionDispatch::Routing::Translator.translate_from_file('config','i18n-routes.yml')
  
  # translate_routes does not work with "*" matches, so we do it manually
  match "(:locale)/*url_match" => "static_pages#show", :locale => /en|ru/
  match "*url_match" => "static_pages#show"
end
