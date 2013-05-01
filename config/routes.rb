UncleNagysHouse::Application.routes.draw do
  resources :episodes, :only => [:index]
  match 'episodes/:number' => 'episodes#show', :as => :episode

  %w(about contact subscribe).each do |page|
    match page => "pages##{page}", :as => page.to_sym
  end

  root :to => 'episodes#index'
end
