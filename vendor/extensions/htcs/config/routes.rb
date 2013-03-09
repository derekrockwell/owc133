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
  namespace :htcs do
    resources :volunteer_categories, :only => [:index, :show]
  end

  # Admin routes
  namespace :htcs, :path => '' do
    namespace :admin, :path => 'refinery/htcs' do
      resources :volunteer_categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :htcs do
    resources :work_hours, :only => [:index, :show]
  end

  # Admin routes
  namespace :htcs, :path => '' do
    namespace :admin, :path => 'refinery/htcs' do
      resources :work_hours, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :htcs do
    resources :volunteers, :only => [:index, :show]
  end

  # Admin routes
  namespace :htcs, :path => '' do
    namespace :admin, :path => 'refinery/htcs' do
      resources :volunteers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
