UncleNagysHouse::Application.routes.draw do
  resources :episodes, :only => [:index]
  get 'episodes/:number' => 'episodes#show', :as => :episode

  %w(about contact subscribe).each do |page|
    get page => "pages##{page}", :as => page.to_sym
  end

  root :to => 'episodes#index'
end
