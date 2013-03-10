Refinery::Core::Engine.routes.append do
  devise_for :volunteers, :controllers => { :sessions => 'refinery/htcs/volunteer_sessions' }, :class_name => 'Refinery::Htcs::Volunteer', :skip_routes => true

  root :to => "refinery/htcs/volunteer_sessions#new"
  post "/volunteers/sign_in"    => "refinery/htcs/volunteer_sessions#create"
  delete "/volunteers/sign_out" => "refinery/htcs/volunteer_sessions#destroy"

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
    resources :work_hours
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
    resources :volunteers
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
