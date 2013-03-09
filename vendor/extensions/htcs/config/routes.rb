Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :htcs do
    resources :htcs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :htcs, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :htcs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :volunteer_categories do
    resources :volunteer_categories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :volunteer_categories, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :volunteer_categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
